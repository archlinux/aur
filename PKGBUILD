# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=quine-relay
pkgver=r122.73e4544
pkgrel=2
pkgdesc='Uroboros program with 100 programming languages (50 language branch)'
arch=(x86_64)
url='http://github.com/mame/quine-relay'
license=(MIT)
conflicts=('quine-relay-git')
replaces=('quine-relay-git')
depends=('algol68g' 'bash' 'beef' 'boo' 'bsd-games' 'c-intercal' 'chicken'
         'clisp' 'clojure' 'coffeescript' 'f2c' 'fpc' 'fpiet' 'gambas3-script'
         'gawk' 'gcc' 'gcc-ada' 'gcc-fortran' 'gcc-objc' 'gforth' 'ghc'
         'gnucobol' 'go' 'groovy' 'icon' 'iverilog' 'jasmin' 'lci-git' 'llvm'
         'make' 'maxima' 'mlton' 'mono' 'mono-basic' 'neko' 'nickle' 'nodejs'
         'ocaml' 'octave' 'pari' 'parrot' 'perl' 'php' 'pike' 'python' 'r'
         'ratfor' 'regina-rexx-das' 'ruby2.7' 'scala' 'scilab-bin' 'slang'
         'smalltalk' 'spl' 'swi-prolog' 'tcl' 'tcc' 'thue' 'ucblogo' 'vala'
         'yorick' 'zoem')
optdepends=('advancecomp: For generating langs.png'
            'optipng: For generating langs.png')
source=('quine-relay::git://github.com/mame/quine-relay.git#branch=50'
        'quine-relay.sh')
b2sums=('SKIP'
        '4ecea359a8253f4aacc885b5d7f6705bb94cd8bcf2e902ddce477c79982201c6da6966902968faa665748182d83fdecfa815889e380e8821a4ed009a694aab06')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  <README.md tail -22 > LICENSE

  # lolcode is available in Arch Linux
  sed -i 's:vendor/lci-\*/::' Makefile

  # fpiet is available in Arch Linux
  #sed -i 's:vendor/npiet-\*/:fpiet:' Makefile

  # whitespace does not work
  sed -i 's:ruby vendor/whitespace.rb:wspace:' Makefile
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/share/quine-relay"
  cp -r * "$pkgdir/usr/share/quine-relay"
  install -Dm755 ../quine-relay.sh "$pkgdir/usr/bin/quine-relay"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
