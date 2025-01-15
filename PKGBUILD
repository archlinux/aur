# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=color-utils
pkgbase=dfl-color-utils
pkgname=(
        'dfl-color-utils'
        'dfl-color-utils-qt6'
)
pkgver=0.2.0
pkgrel=2
pkgdesc="A simple pure Qt/C++ implementation of the cylindrical color space model characterized by Hue-Chroma-Luma"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
makedepends=(
            'meson'
            'ninja'
            'qt5-base'
            'qt6-base'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('c49792cc956d4df975201ae60b68d9378dd52bbb4fdad205dd3f264b5aab107f')

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
