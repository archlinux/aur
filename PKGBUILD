# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=Volume
pkgname=desq-utils-volume
pkgver=0.0.9
pkgrel=1
pkgdesc="Volume control for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'qt6-svg'
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
sha256sums=('3e8b313770c4bcbdf8d14ee4f9ca85524903a89f55c6a968d5a122ab526aae7e')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
