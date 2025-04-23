# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=Disks
pkgname=desq-utils-disks
pkgver=0.0.9
pkgrel=1
pkgdesc="Disks Auto Mounter for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'hicolor-icon-theme'
        'libdesqui'
        'dfl-settings'
        'dfl-utils'
        'dfl-applications'
        'dfl-xdg'
        'dfl-storage'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('b7bd290a1927f6b8ac8f9c5a6eb345623aa9579af02e1c2881fda197d3eed7f0')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
