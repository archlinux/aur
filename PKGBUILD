# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=utils
pkgbase=dfl-utils
pkgname=('dfl-utils' 'dfl-utils-qt6')
pkgver=0.2.0
pkgrel=1
pkgdesc="Some utilities for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja' 'qt5-base' 'qt6-base')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('72851a9dc222e63621a87b1551b77367')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-utils() {
  depends=('qt5-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-utils-qt6() {
  depends=('qt6-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
