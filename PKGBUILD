# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell -> desq-theme

_pkgname=Theme
pkgname=desq-theme
pkgver=0.0.9
pkgrel=1
pkgdesc="DesQ Themes"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL3-or-later')
depends=(
        'qt6-base'
        'libdesqui'
        'dfl-settings'
        'dfl-applications'
        'dfl-colorschemeparser'
        'dfl-utils'
        'dfl-xdg'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('4f9ff859353d34d81f053b2779ccb188d9da6d33af5f33cee52ebbc9f15f257e')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
