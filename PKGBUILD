# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## dfl-wayqt -> dfl-gamma-effects

_pkgname=gamma-effects
pkgname=('dfl-gamma-effects')
pkgver=0.3.0
pkgrel=1
pkgdesc="A class to handle various display effects that can be performed using wlr-gamma-control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=(
        'qt6-base'
        'dfl-wayqt'
)
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('39d17153fc6e4c19067a3c5dcf3b483ff8b44a62277e76a97d2b15b89cfa5a47')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT6 version..."
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package_dfl-gamma-effects() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
