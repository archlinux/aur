# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

pkgname=libdesqui
pkgver=0.0.9
pkgrel=1
pkgdesc="DesQ UI Library. This library contains all the common UI widget which are to be used across the DesQ Project."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'libdesq'
        'dfl-layouts'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('d3d3f41453dfd32ca0f9c648da48a2032de041c8d9259692d9a30f1c226ec913')

build() {
  cd "${pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
