# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-wayqt -> dfl-clipboard

_pkgname=clipboard
pkgbase=dfl-clipboard
pkgname=('dfl-clipboard') #'dfl-clipboard-qt6') #qt6 version does not build in 0.1.1, should work when 0.2.0 releases
pkgver=0.1.1
pkgrel=1
pkgdesc="Clipboard Manager based on wlroots data control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('3243e47e1cedfb7fd7904095e0cfdc0c')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build

#  echo "Building QT6 version..."
#  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
#  ninja -C .build-qt6
}

package_dfl-clipboard() {
  depends=('qt5-base' 'dfl-wayqt')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

#package_dfl-clipboard-qt6() {
#  depends=('qt6-base' 'dfl-wayqt-qt6')
#  cd "${_pkgname}-v${pkgver}"
#  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
#}
