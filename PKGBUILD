# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libdai
pkgver=0.3.2
pkgrel=2
pkgdesc="Implementations of approximate inference methods for discrete graphical models"
arch=('i686' 'x86_64')
url="https://staff.fnwi.uva.nl/j.m.mooij/libDAI"
license=('GPL')
depends=('boost-libs' 'gmp')
optdepends=('doxygen' 'graphviz')
source=("https://staff.fnwi.uva.nl/j.m.mooij/libDAI/libDAI-0.3.2.tar.gz")
md5sums=('fc540e0381339dcb3d8abdac80fe9a40')

build() {
  cd "$srcdir/libDAI-$pkgver"

  cp Makefile.LINUX Makefile.conf
  sed -i "/TARGETS:=/s| tests | |" Makefile
  sed -i "/unittests testregression testem/d" Makefile

  make BOOSTLIBS_PO=-lboost_program_options BOOSTLIBS_UTF=-lboost_unit_test_framework
}

package() {
  cd "$srcdir/libDAI-$pkgver"
  install -Dm755 lib/libdai.a "$pkgdir/usr/lib/libdai.a"

  for FILE in $(find include -type f); do
    install -Dm644 $FILE "$pkgdir/usr/$FILE"
  done
}
