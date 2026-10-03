# Maintainer: Dmitry Valter <dvalter@protonmail.com>

pkgname=argagg
pkgver=0.4.7
pkgrel=3
pkgdesc='Simple C++ command line argument/option parser'
arch=('any')
url='https://github.com/vietjtnguyen/argagg'
license=('MIT')
makedepends=('cmake' 'doxygen')
provides=('argagg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('85634bff33236ffcb0aea03a6fa4b3529b6d1faa03f8e030f3c5401fc453bb5e1964f7d0644e4f3fc089ccd7751ea94c466e02b85f7c9701ce21adcc20c0b058')


build() {
  cd "$pkgname-$pkgver"

  cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM='3.5'

  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" cmake --build build -- install
}

check () {
  cd "$pkgname-$pkgver"
  cmake --build build -- test
}
