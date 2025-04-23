# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## dfl-login1 -> dfl-wayqt -> dfl-gamma-effects -> dfl-power

_pkgname=power
pkgname=('dfl-power')
pkgver=0.3.0
pkgrel=1
pkgdesc="A class to handle various display effects that can be performed using wlr-gamma-control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=(
        'qt6-base'
        'dfl-gamma-effects'
        'dfl-login1'
        'dfl-wayqt'
)
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('ea9eaffd451164d562f3afb1dddf3d0202821e440be11980f6ce8c5460a773ff')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT6 version..."
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
