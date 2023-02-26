# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=molequeue
pkgver=0.9.0
pkgrel=3
pkgdesc="Desktop integration of high performance computing resources"
arch=(x86_64)
url="http://www.openchemistry.org/"
license=(custom)
depends=(qt5-base)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::"https://github.com/OpenChemistry/molequeue/archive/$pkgver.tar.gz")
sha256sums=('7dd234742c8d73be95281fedf4ed9d09648ecc351afb5f098cd32f48c3df3bd5')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE  -t "$pkgdir"/usr/share/licenses/$pkgname/
}
