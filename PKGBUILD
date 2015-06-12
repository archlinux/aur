# Maintainer: Michael Schubert <mschu.dev at gmail>

_pkgname=libDAI
#pkgname=${_pkgname,,}
pkgname=libdai
pkgver=0.3.1
pkgrel=1
pkgdesc="Implementations of approximate inference methods for discrete graphical models"
arch=('i686' 'x86_64')
url="http://cs.ru.nl/~jorism/libDAI/"
license=('GPL')
depends=('boost-libs' 'gmp')
optdepends=('doxygen' 'graphviz')
source=("http://cs.ru.nl/~jorism/libDAI/libDAI-${pkgver}.tar.gz")
md5sums=('f9ae3e01ec0f829b7d00556a134763ec')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  cp Makefile.LINUX Makefile.conf
  sed -i "/TARGETS:=/s| tests | |" Makefile
  sed -i "/unittests testregression testem/d" Makefile

  make BOOSTLIBS_PO=-lboost_program_options BOOSTLIBS_UTF=-lboost_unit_test_framework
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 lib/libdai.a "$pkgdir/usr/lib/libdai.a"

  for FILE in $(find include -type f); do
    install -Dm644 $FILE "$pkgdir/usr/$FILE"
  done
}

# vim:set ts=2 sw=2 et:
