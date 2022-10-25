# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=color-utils
pkgbase=dfl-color-utils
pkgname=('dfl-color-utils' 'dfl-color-utils-qt6')
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple pure Qt/C++ implementation of the cylindrical color space model characterized by Hue-Chroma-Luma"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja' 'qt5-base' 'qt6-base')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('cb436f7f0d479c9cf8f7eacd694b6071')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-color-utils() {
  depends=('qt5-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-color-utils-qt6() {
  depends=('qt6-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
