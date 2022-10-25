# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-color-utils -> dfl-config-parser

_pkgname=config-parser
pkgbase=dfl-config-parser
pkgname=('dfl-config-parser' 'dfl-config-parser-qt6')
pkgver=0.1.1
pkgrel=1
pkgdesc="A Collection of Config Parsers for DFL. Currently it contains a config parser for KDE Color Schemes"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja' 'qt5-base' 'qt6-base' 'dfl-color-utils' 'dfl-color-utils-qt6')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('9f1571003b172d6f908ca0bcd2acac84')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-config-parser() {
  depends=('qt5-base' 'dfl-color-utils')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-config-parser-qt6() {
  depends=('qt6-base' 'dfl-color-utils-qt6')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
