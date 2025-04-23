# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=volume
pkgname=('dfl-volume')
pkgver=0.3.0
pkgrel=1
pkgdesc="Volume control to allow users to choose devices and control the volume"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=(
        'qt6-base'
        'libpipewire'
)
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('ef1de221f019c42483d7e803af115aefa7d44858a822bf5abfdd4f49128ed0d0')

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
