# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=Runner
pkgname=desq-utils-runner
pkgver=0.0.9
pkgrel=1
pkgdesc="A simple app launcher for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'hicolor-icon-theme'
        'libdesq'
        'libdesqui'
        'dfl-applications'
        'dfl-inotify'
        'dfl-ipc'
        'dfl-settings'
        'dfl-utils'
        'dfl-wayqt'
        'dfl-xdg'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('6b3ea5778ea6d9cd20e0f8281025a865d7953d12a2cdad5d30c48b7cb2b0adfb')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
