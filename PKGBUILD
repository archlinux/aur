# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Integration
pkgname=desq-integration
pkgver=0.0.8
pkgrel=2
pkgdesc="Qt Platform and Style Integration Plugins for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'libdesqui'
        'dfl-settings'
        'dfl-utils'
        'dfl-applications'
        'dfl-xdg'
        'dfl-colorschemeparser'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('c3185555c3d67ba211405a9f7f20cf6ef83b3b7799947acf919a36aadfaa6bfd')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

