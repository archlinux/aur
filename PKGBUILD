# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.7.2
pkgrel=3
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/Nheko-Reborn/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient>=0.3.0' 'spdlog')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'tweeny')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/nheko/archive/v$pkgver.tar.gz")
sha512sums=('8f253bdac22a2d3412fcb18671145d9601d8609dbc79358412e81a17a9677a1cb44b6fc4d029f4d850818cb3fe3531adc869a7e54273e7bb17d0aa7ef85dce17')

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

