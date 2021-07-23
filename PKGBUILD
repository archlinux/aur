# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.19.0
pkgrel=3
pkgdesc='C library for arbitrary-precision floating-point ball arithmetic'
arch=(x86_64)
url='http://arblib.org/'
license=(LGPL)
depends=(flint)
source=(https://github.com/fredrik-johansson/arb/archive/$pkgver/$pkgname-$pkgver.tar.gz
        arb-flint2.8.patch::https://github.com/fredrik-johansson/arb/commit/b6c8032e.patch)
sha256sums=('0aec6b492b6e9a543bdb3287a91f976951e2ba74fd4de942e692e21f7edbcf13'
            '031b5e734ac7d23d769a5d6448c8eb76210a808087acd823fbde726e55fcc464')

prepare() {
  patch -d $pkgname-$pkgver -p1 < arb-flint2.8.patch # Fix build with flint 2.8
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
