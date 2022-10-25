# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-login1 -> dfl-wayqt -> dfl-gamma-effects - dfl-power

_pkgname=power
pkgbase=dfl-power
pkgname=('dfl-power' 'dfl-power-qt6')
pkgver=0.1.1
pkgrel=1
pkgdesc="A class to handle various display effects that can be performed using wlr-gamma-control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('upower')
makedepends=('meson' 'ninja' 'qt5-base' 'qt6-base' 'dfl-wayqt' 'dfl-wayqt-qt6' 'dfl-gamma-effects' 'dfl-gamma-effects-qt6' 'dfl-login1' 'dfl-login1-qt6')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('67c73637c4b40f9a78730c157b352b2c')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-power() {
  depends+=('qt5-base' 'dfl-color-utils' 'dfl-wayqt' 'dfl-gamma-effects' 'dfl-login1')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-power-qt6() {
  depends+=('qt6-base' 'dfl-color-utils-qt6' 'dfl-wayqt-qt6' 'dfl-gamma-effects-qt6' 'dfl-login1-qt6')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
