# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Volume
pkgname=desq-utils-volume
pkgver=0.0.8
pkgrel=3
pkgdesc="Volume control for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'qt5-svg'
        'libcanberra'
        'libpulse'
        'libdesqui'
        'libpipewire'
        'dfl-settings'
        'dfl-utils'
        'dfl-wayqt'
        'dfl-xdg'
        'dfl-applications'
        'dfl-volume'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('2c0d8c1261fe2ec0e1f6abebfd1df8246e369265092c5fe2e6d8b0ebd0c659c6')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
