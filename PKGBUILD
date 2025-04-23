# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=wayqt
pkgname=('dfl-wayqt')
pkgver=0.3.0
pkgrel=1
pkgdesc="A Qt-based wrapper for various wayland protocols"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=(
        'qt6-base'
        'qt6-wayland'
        'wayland-protocols'
        'wayland'
)
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('d1c8abe7c104c81db7535360dbba6ecd2558156a8b76b6b66ad411605009fbd0')

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
