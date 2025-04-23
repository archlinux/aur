# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=inotify
pkgname=('dfl-inotify')
pkgver=0.3.0
pkgrel=1
pkgdesc="A Qt wrapper around inotify"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('c24afa0ca695c169818e7a3f0d168c3a2cc75d1708257c64039bc9a7db76ce69')

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
