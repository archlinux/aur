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
         'smalltalk' 'spl' 'swi-prolog' 'tcl' 'thue' 'ucblogo' 'vala' 'yorick'
         'zoem')
optdepends=('advancecomp: For generating langs.png'
            'optipng: For generating langs.png')
source=('quine-relay::git://github.com/mame/quine-relay.git#branch=50'
        'quine-relay.sh')
b2sums=('SKIP'
        '143a883a909cfd01b5b22dc6b9478841ab9ade06d6907482cc2ab4244e5c5876d63befd83186613e69ea0d774541d4962748940195bfdea6ea9f2d531b8baedb')

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
  #sed -i 's:ruby whitespace.rb:ruby-2.7 whitespace.rb:' Makefile
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/share/quine-relay"
  cp -r * "$pkgdir/usr/share/quine-relay"
  install -Dm755 ../quine-relay.sh "$pkgdir/usr/bin/quine-relay"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
