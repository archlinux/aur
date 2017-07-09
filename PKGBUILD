# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.11.0
pkgrel=2
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(i686 x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=("https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz" arb-flint-2.5.2.patch)
sha256sums=('1191c81074019ed1a8552fbb765709b863f62345d6d4bf204c1cf8a506506ba4'
            '9956c5340e4925c806c549f132edc04ccb466bd2336c3e6f86f14ec5d3b869a0')

prepare() {
  cd $pkgname-$pkgver
# Fix build with flind 2.5.2
  patch -p1 -i ../arb-flint-2.5.2.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
