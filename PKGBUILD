# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.17.0
pkgrel=2
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(x86_64)
url="http://arblib.org/"
license=(LGPL)
depends=(flint)
source=($pkgname-$pkgver.tar.gz::"https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz"
        flint-arb-2.6.patch::"https://github.com/fredrik-johansson/arb/commit/d3d99832.patch")
sha256sums=('145a7a8e0e449b8a30de68c75c10b146c4f199544262711bef6fb49d3012d6e1'
            '017962abdc31bac90a3dda37f98b67f67d2c8fd273bd7bde86f183dec1aba377')

prepare() {
  patch -d $pkgname-$pkgver -p1 -i ../flint-arb-2.6.patch # Fix build with flint 2.6
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
