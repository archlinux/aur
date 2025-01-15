# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## dfl-ipc ->

_pkgname=ipc
pkgbase=dfl-ipc
pkgname=(
        'dfl-ipc'
        'dfl-ipc-qt6'
)
pkgver=0.2.0
pkgrel=2
pkgdesc="A very simple set of IPC classes for inter-process communication"
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
sha256sums=('df33b4fa6ba8e53c983b57df327a5bb27779674c710a5435b9716fed2d505bf9')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-ipc() {
  depends=('qt5-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-ipc-qt6() {
  depends=('qt6-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
