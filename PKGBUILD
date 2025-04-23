# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=ViewInfo
pkgname=desq-utils-viewinfo
pkgver=0.0.9
pkgrel=1
pkgdesc="A simple interface to get information about various views for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'hicolor-icon-theme'
        'libdesq'
        'libdesqui'
        'dfl-applications'
        'dfl-utils'
        'dfl-wayqt'
        'dfl-xdg'
        #'wf-info' #no release yet
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('f54f71edd8f0ec897dc660c1a03ca58a3d4b5c3eeadfe0b6c4d5a13cf5c94e4c')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
