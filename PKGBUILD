# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=layouts
pkgbase=dfl-layouts
pkgname=('dfl-layouts' 'dfl-layouts-qt6')
pkgver=0.2.0
pkgrel=1
pkgdesc="Special layouts, ex, Dynamic Layout, Circular Layout etc"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja' 'qt5-base' 'qt6-base')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('fb4c74bcebf62b8da909d6bfd3c6f195')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-layouts() {
  depends=('qt5-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-layouts-qt6() {
  depends=('qt6-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
