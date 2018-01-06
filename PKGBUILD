# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=cdbxx
pkgver=0.0.1rc2
pkgrel=5
pkgdesc="cdbxx is a small STL style C++ library for TinyCDB implementation of Constant Database"
arch=(x86_64)
url="http://cdbxx.sourceforge.net/"
license=("GPL")
depends=(gcc)
makedepends=(tinycdb)
source=(http://downloads.sourceforge.net/sourceforge/cdbxx/$pkgname-$pkgver.tar.bz2)
md5sums=('8c7f3eebe5c090ddea4aebf5445a1621')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  sed -i 's#LDFLAGS = -Wl,-rpath,$(shell pwd)/../src/ -L../src/ -lcdbxx#LDFLAGS = -Wl,-rpath,$(shell pwd)/../src/ -L../src/ -lcdbxx -lcdb#' ./testsuite/Makefile
  sed -i '1,2i#include <string.h>' src/db.cc

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
