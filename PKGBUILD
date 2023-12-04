# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=volume
pkgbase=dfl-volume
pkgname=('dfl-volume' 'dfl-volume-qt6')
pkgver=0.2.0
pkgrel=1
pkgdesc="Volume control to allow users to choose devices and control the volume"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('libpulse')
makedepends=('meson' 'ninja' 'qt5-base' 'qt6-base')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('4a1c90159f407dbd1fcf2865937db653')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-volume() {
  depends+=('qt5-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-volume-qt6() {
  depends+=('qt6-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
