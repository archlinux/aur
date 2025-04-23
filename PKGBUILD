# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=DesQTerm
pkgname=desq-apps-term
pkgver=0.0.9
pkgrel=1
pkgdesc="A simple terminal emulator for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQApps/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'qtermwidget'
        'libdesqui'
        'dfl-settings'
        'dfl-utils'
        'dfl-applications'
        'dfl-xdg'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQApps/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('68283221e6be6bf8b5d0493da98c8d1d7f28c14ca209c7133dcf2de018866b59')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
