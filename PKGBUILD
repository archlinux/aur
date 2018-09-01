# Maintainer: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=pdftk-java-git
pkgver=r72.d5cf2c0
pkgrel=1
pkgdesc="Port of pdftk into Java"
url='https://gitlab.com/pdftk-java/pdftk'
arch=('i686' 'x86_64')
license=('GPL')
depends=('java-runtime-headless' 'bcprov' 'java-commons-lang3')
optdepends=('poppler: Additional PDF utilities')
makedepends=('apache-ant' 'git')

source=("git+https://gitlab.com/pdftk-java/pdftk.git"
        'pdftk.pdftk-java')
md5sums=('SKIP'
         '070aa01cf454d92826d9ea0141eeedec')
sha256sums=('SKIP'
            '48c481a27786324aa7fb7cf49c47a9af83ea14a24f5c25bd0d3580c4b2f202cc')

pkgver() {
  cd "$srcdir/pdftk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/pdftk"
  mkdir lib
  ln -sf /usr/share/java/commons-lang3/commons-lang3.jar lib/commons-lang3.jar
  ln -sf /usr/share/java/bcprov.jar lib/bcprov.jar
}

build() {
  cd "$srcdir/pdftk"
  ant jar
}

package() {
  cd "$pkgdir"
  mkdir -p usr/bin
  mkdir -p usr/share/pdftk
  cp $srcdir/pdftk.pdftk-java usr/bin
  cp $srcdir/pdftk/build/jar/pdftk.jar usr/share/pdftk
}

# vim:set ts=2 sw=2 ft=sh et:
