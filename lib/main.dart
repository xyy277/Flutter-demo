import 'package:desktop_app/router/screen_arguments.dart';
import 'package:desktop_app/view/home/extract_arguments_screen.dart';
import 'package:desktop_app/view/home/pass_arguments_screen.dart';
import 'package:desktop_app/view/home_screen.dart';
import 'package:desktop_app/view/test/second_screen.dart';

import 'view/test/first_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp2());

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
      },
    );
  }

}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
//        PassArgumentsScreen.routeName: (context) =>
//            const PassArgumentsScreen(title: 'a',message: 's'),
      },

      onGenerateRoute: (settings) {
        if(settings.name == PassArgumentsScreen.routeName) {
          final args = settings.arguments as ScreenArguments;
          return MaterialPageRoute(builder: (context) {
            return PassArgumentsScreen(
              title: args.title,
              message: args.message,
            );
          });
        }

        assert(false, 'Need to implement ${settings.name}');
        return null;
      },

      title: 'Navigation with arguments',
      home: const HomeScreen(),
    );
  }

}