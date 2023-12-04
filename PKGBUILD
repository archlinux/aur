# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## dfl-wayqt -> dfl-clipboard

_pkgname=clipboard
pkgbase=dfl-clipboard
pkgname=('dfl-clipboard' 'dfl-clipboard-qt6')
pkgver=0.2.0
pkgrel=1
pkgdesc="Clipboard Manager based on wlroots data control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja' 'dfl-wayqt' 'dfl-wayqt-qt6')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('c5516a6b78116d0b3ceac0e4de136a0a')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build

  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-clipboard() {
  depends=('qt5-base' 'dfl-wayqt')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-clipboard-qt6() {
  depends=('qt6-base' 'dfl-wayqt-qt6')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
