# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

pkgname=libdesq
pkgver=0.0.9
pkgrel=1
pkgdesc="The DesQ library to handle X11 protocols, system calls, classes and functions to be used across the DesQ project."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'dfl-settings'
        'dfl-hjsonparser'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('569bb1bd021171caee3752a41decbb328ce87febcb167097a23c0b55769eb3ec')

build() {
  cd "${pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
