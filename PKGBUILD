# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=layouts
pkgname=('dfl-layouts')
pkgver=0.3.0
pkgrel=1
pkgdesc="Special layouts, ex, Dynamic Layout, Circular Layout etc"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('1f8f56b83667394e151022ae359c2641e2e22d39bd8385611a92c9b17106dba3')

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
