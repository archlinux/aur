# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Lock
pkgname=desq-utils-lock
pkgver=0.0.8
pkgrel=3
pkgdesc="Screen Locker for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'libdesq'
        'hicolor-icon-theme'
        'pam'
        'dfl-wayqt'
        'dfl-settings'
        'dfl-applications'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('8679571f5c2ea76faef0229cd66019d159e1614d21f3402676bf6cc048673255')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
