# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=PowerManager
pkgname=desq-utils-powermanager
pkgver=0.0.8
pkgrel=3
pkgdesc="Power manager for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'hicolor-icon-theme'
        'libdesq'
        'dfl-wayqt'
        'dfl-settings'
        'dfl-login1'
        'dfl-power'
        'dfl-utils'
        'dfl-xdg'
        'dfl-applications'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('37003c2ead8b07d6d89b3adf64debd2cc257f95db4ac988d9a37f4be18b2a0ee')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
