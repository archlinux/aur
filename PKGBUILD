# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## dfl-wayqt -> dfl-gamma-effects

_pkgname=gamma-effects
pkgbase=dfl-gamma-effects
pkgname=('dfl-gamma-effects' 'dfl-gamma-effects-qt6')
pkgver=0.2.0
pkgrel=1
pkgdesc="A class to handle various display effects that can be performed using wlr-gamma-control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja' 'qt5-base' 'qt6-base' 'dfl-wayqt' 'dfl-wayqt-qt6')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('4b228f0def73fe5b6909135a7e9599ad')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-gamma-effects() {
  depends=('qt5-base' 'dfl-wayqt')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-gamma-effects-qt6() {
  depends=('qt6-base' 'dfl-wayqt-qt6')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
