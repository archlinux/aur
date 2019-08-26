# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ring-kde
pkgver=3.0.0
pkgrel=2
pkgdesc='The KDE client for the Ring communication framework'
url='http://www.ring.cx/'
license=(GPL2)
arch=(x86_64)
depends=(kirigami2 knotifyconfig kdeclarative ring-daemon)
makedepends=(extra-cmake-modules kdoctools akonadi-contacts boost)
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('79f6ce6b9d6cf5fc2b089d764408455460d673d17ae91033104de3f47e388a9f')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
