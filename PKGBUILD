# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.13.0
pkgrel=1
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=($pkgname-$pkgver.tar.gz::"https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz")
sha256sums=('d075116d094bfda96f9c4ce10bb9bf23b333a8246f48c532427168d0f91b7788')

prepare() {
  cd $pkgname-$pkgver
#  sed -e 's|-Wl,-r|-r|' -i Makefile.subdirs
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
