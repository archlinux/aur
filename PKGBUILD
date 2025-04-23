# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=storage
pkgname=('dfl-storage')
pkgver=0.3.0
pkgrel=1
pkgdesc="A class that extends QApplications"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('9051b10ab4c96c905f5b773d4b2875574f3328d806c691f8a263281b8ab1706b')

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
