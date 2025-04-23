# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=xdg
pkgname=('dfl-xdg')
pkgver=0.3.0
pkgrel=1
pkgdesc="XDG Specifications implementation for Qt"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('4f0200254f7ef8d6c6050ba6921ca1742d73c47e12f1e2891f69500aa4faae89')

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
