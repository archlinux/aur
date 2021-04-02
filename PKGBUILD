# Maintainer: Joe Neeman <joeneeman@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=frobby
pkgver=0.9.1
pkgrel=1
pkgdesc="Computations With Monomial Ideals"
arch=('i686' 'x86_64')
url="https://github.com/Macaulay2/frobby"
license=('GPL')
depends=('gmp')
source=(https://github.com/Macaulay2/frobby/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('4bd699ff009973bc2d209ec9abdee33ef09e11de83914046fcc4ce68e7cc25b5')

build() {
  cd "$srcdir/frobby-$pkgver"
  make CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS"
  RANLIB=/usr/bin/ranlib make CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" library
}

package() {
  cd "$srcdir/frobby-$pkgver"
  install -D -m 755 bin/frobby $pkgdir/usr/bin/frobby 
  install -D -m 644 bin/libfrobby.a $pkgdir/usr/lib/libfrobby.a
  install -D -m 644 src/frobby.h $pkgdir/usr/include/frobby.h
  install -D -m 644 src/stdinc.h $pkgdir/usr/include/stdinc.h
}

