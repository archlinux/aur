# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=SNI
pkgname=desq-utils-sni
pkgver=0.0.8
pkgrel=2
pkgdesc="System tray for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'libdesqui'
        'libdbusmenu-qt5'
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
sha256sums=('3b3d9b5abe5308724817f1600a05843e69a837858e67d4e26d2f4da77c99c953')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
