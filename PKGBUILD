# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=Integration
pkgname=desq-integration
pkgver=0.0.9
pkgrel=1
pkgdesc="Qt Platform and Style Integration Plugins for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'qt6-wayland'
        'libdesqui'
        'dfl-settings'
        'dfl-utils'
        'dfl-wayqt'
        'dfl-applications'
        'dfl-xdg'
        'dfl-colorschemeparser'
        'dfl-hjsonparser'
        'dfl-status-notifier'
        'libpipewire'
        'libinih'
        'libdrm'
        'sdbus-cpp'
        'wayland'
        'wayland-protocols'
        'gdm'
)
optdepends=('systemd')
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('3f4dbe3b4d963ec14401952377ef98f18778fbdeaf110f8f83beadd3371a7c3b')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

