# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.8.1
pkgrel=1
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(i686 x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=("https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz"
	fix-flint-includes.patch::"http://git.sagemath.org/sage.git/plain/build/pkgs/arb/patches/flint_includes.patch?id=83094377")
md5sums=('b6b94a39b71293b6811a191cb9542096'
         '666fff29e723bad787f4935b4417b3a8')

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
