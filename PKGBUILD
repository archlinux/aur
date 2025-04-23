# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=SNI
pkgname=desq-utils-sni
pkgver=0.0.9
pkgrel=1
pkgdesc="System tray for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'libdesq'
        'libdesqui'
        'libdbusmenu-lxqt'
        'dfl-utils'
        'dfl-applications'
        'dfl-status-notifier'
        'dfl-layouts'
        'dfl-xdg'
        'dfl-wayqt'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('f5c6d3bfb9bd1233809e956fc63b0b529afe6ae795a12f36974e81a84ed77595')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
