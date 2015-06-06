'use strict'

module.exports = (grunt) ->

  # coffeeLintRules = require './coffeelint'
  PATTERN_LOAD_TASK =
    pattern: 'grunt-*'
    scope: 'devDependencies'

  
  (require 'load-grunt-tasks')(grunt, PATTERN_LOAD_TASK)

  # configure the tasks
  grunt.initConfig
    
    nodemon:
      dev:
        script: 'app/app.js'
        options:
          args: []
          ignore: ['public/**', 'node_modules/**']
          watch: ['app', 'Gruntfile.coffee']
          ext: 'js,html'
          nodeArgs: ['--debug']
          delayTime: 1
          env:
              PORT: 3000
          cwd: __dirname

    # Concurrent tasks
    concurrent:
      dev:
        tasks: ['nodemon']
        options:
          logConcurrentOutput: true

  #Create task to server Up.
  grunt.registerTask 'dev', 'Compile then start a connect web server', (target) ->

    grunt.task.run [
      'concurrent:dev'
    ]
