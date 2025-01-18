# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Runner
pkgname=desq-utils-runner
pkgver=0.0.8
pkgrel=3
pkgdesc="A simple app launcher for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'hicolor-icon-theme'
        'libdesq'
        'dfl-applications'
        'dfl-ipc'
        'dfl-settings'
        'dfl-utils'
        'dfl-wayqt'
        'dfl-xdg'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('2d93ee468ef60fad5f3a4aa4d5c420bda4720919e07cdd0fb1d81aac5b815263')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
