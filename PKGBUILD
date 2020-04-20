# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.7.0
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/Nheko-Reborn/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols2' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient>=0.3.0' 'spdlog')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'tweeny')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/nheko/archive/v$pkgver.tar.gz")
sha512sums=('0e30b3937b8cf92ff250496df999aafea86f18ddc8301b9feafe52db66e10b5f95b177931582d0b5418a1084b8dc9fbed31f15ec5573dcadade2a3bec7d19e9e')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  # The compilation takes up a *lot* of RAM (over 10GB with 6 threads)
  # Adjust your MAKEFLAGS in /etc/makepkg.conf or add e.g. a "-j3" flag to the make command
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

