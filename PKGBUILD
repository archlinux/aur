# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## libdesq -> desq-session -> desq-shell

_pkgname=Session
pkgname=desq-session
pkgver=0.0.9
pkgrel=1
pkgdesc="Session Manager for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
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
sha256sums=('6804b4bd1ea0ca2dc937651b9047745c1bdfb0cb93261f00d02dff4c350525f7')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
