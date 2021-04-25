# Maintainer: Dmitry Valter <dvalter@protonmail.com>

pkgname=argagg
pkgver=0.4.6
pkgrel=1
pkgdesc='Simple C++ command line argument/option parser'
arch=('any')
url='https://github.com/vietjtnguyen/argagg'
license=('MIT')
makedepends=('cmake' 'doxygen')
provides=('argagg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        0000-gcc-8-1-catch.patch)
sha512sums=('7d8cf04a7c679518f01120830637c68719dd67a765457789eb4afedbead7be9efadc6bcdf640999329aaaf8659a5e5d1896f66587068cc668a7c49703aca3070'
            '14c0fa2dd2aabd18e0a8f3407ed10756b3094c9890de28abafcfaa808ef541e20325d8ca900e290b1494a9df189f1cb085677ac5095629eefe0e8efd9b43768e')


prepare() {
  cd "$pkgname-$pkgver"
  patch -Np2 test/doctest.h -i "$srcdir/0000-gcc-8-1-catch.patch"
}

build() {
  mkdir -p "$pkgname-$pkgver/build"
  cd "$pkgname-$pkgver/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
}

