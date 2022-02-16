# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.9.1
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/Nheko-Reborn/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qtkeychain-qt5' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient>=0.4.1' 'spdlog' 'gst-plugins-base-libs' 'gst-plugins-bad-libs')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'tweeny')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/nheko/archive/v$pkgver.tar.gz")
sha512sums=('a914265052e6c2e327f45ea490999ea2fd22dda3955117f7d92a13b56018bd2c6999318c730e0c03b0e62a5a692678d1655f5bc15e4947db8a3bb9c4cea90e73')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
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

