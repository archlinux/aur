# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.10.1
pkgrel=2
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/Nheko-Reborn/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qtkeychain-qt5' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient>=0.4.1' 'spdlog' 'gst-plugins-base-libs' 'gst-plugins-bad-libs')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'tweeny' 'asciidoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/nheko/archive/v$pkgver.tar.gz")
sha512sums=('898582c1a09ad9cfac3285f0bc5e80bb5e69b1d744118822167bbe09e9aa44c2b28438db2d3b6e1fa88835de2b0e2f58726d3876661f28c5eb46475e2f54bc20')

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

