# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## libdesq -> desq-session -> desq-shell

_pkgname=Session
pkgname=desq-session
pkgver=0.0.8
pkgrel=2
pkgdesc="Session Manager for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'libdesq'
        'dfl-utils'
        'dfl-xdg'
        'dfl-applications'
        'dfl-login1'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('b5a9c0fce1b6f02b4dad6b2f04dba8913fd1101d0f92e9a8ad8d71ddd2b2b54c')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
