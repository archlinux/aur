# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=color-utils
pkgname=('dfl-color-utils')
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple pure Qt/C++ implementation of the cylindrical color space model characterized by Hue-Chroma-Luma"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('3700cdc9c2c08e9d1a045a09230da281670fcc4547b32c32a3a2628914fffc4c')

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
