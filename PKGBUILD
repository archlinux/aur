# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

pkgname=libdesq
pkgver=0.0.8
pkgrel=2
pkgdesc="The DesQ library to handle X11 protocols, system calls, classes and functions to be used across the DesQ project."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'dfl-settings'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('5b32aab28ddd5836a906e8c1afcfffeba688c161ee9a9387284a75f438552863')

build() {
  cd "${pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
