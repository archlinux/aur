# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=settings
pkgname=('dfl-settings')
pkgver=0.3.0
pkgrel=1
pkgdesc="A class that extends QSettings"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('fecb53775dcec5c18306c113ff86390cf149bf1f270a6fc3b4746dc020f2ade8')

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
