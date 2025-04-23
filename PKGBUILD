# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=login1
pkgname=('dfl-login1')
pkgver=0.3.0
pkgrel=1
pkgdesc="Implementation of systemd/elogind for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('9fa2fecf02ee96fac8631361c2ff29c93bf5a585918e77f5834667ac7e09e2bf')

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
