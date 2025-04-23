# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=DesQDropDown
pkgname=desq-apps-dropdown
pkgver=0.0.9
pkgrel=1
pkgdesc="A Quake-style DropDown app capable of showing widgets for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQApps/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'libdesqui'
        'dfl-applications'
        'dfl-settings'
        'dfl-utils'
        'dfl-xdg'
        'dfl-wayqt'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQApps/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('367192ea154a08031ed84ab177cc26d35b60918a36d7dfb5709c4d6f3a0ddffa')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
