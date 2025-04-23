# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## dfl-ipc ->

_pkgname=ipc
pkgname=('dfl-ipc')
pkgver=0.3.0
pkgrel=1
pkgdesc="A very simple set of IPC classes for inter-process communication"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('e97c2ac4abad1ec1da948f6ccbdce21d1f3eb1783d9f921aae7d4d2b5973bdef')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT6 version..."
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
