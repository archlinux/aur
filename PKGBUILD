# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=utils
pkgname=('dfl-utils')
pkgver=0.3.0
pkgrel=1
pkgdesc="Some utilities for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('ba45235b8e497dfb27e6073b652675f97a16e37a6d4e75ae57f731797d15afc3')

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
