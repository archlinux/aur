# Maintainer: Dan Johansen <strit@archlinux.orgk>

## Build order:
## dfl-ipc -> dfl-applications

_pkgname=applications
pkgname=('dfl-applications')
pkgver=0.3.0
pkgrel=1
pkgdesc="A class that extends QApplications"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=(
        'qt6-base'
        'dfl-ipc'
)
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('125c9ea260f013cb03e512f91ebf0ed87b41e87c5dfda1aba41724244b4564c1')

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
