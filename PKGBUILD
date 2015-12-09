# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.7.0
pkgrel=3
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(i686 x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=("https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz"
	fix-flint-includes.patch::"http://git.sagemath.org/sage.git/plain/build/pkgs/arb/patches/flint_includes.patch?h=develop")
md5sums=('f56a1d5d748f51da8ac47653bca9e2dc'
         'a70af061f2a3921568cb949dd06956ec')

prepare() {
  cd $pkgname-$pkgver
# Fix flint include paths
  patch -p1 -i ../fix-flint-includes.patch
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
