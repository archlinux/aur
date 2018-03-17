# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=pace
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://github.com/softwareperonista/pace'
depends=('gtksourceview3')
makedepends=('meson' 'vala')
source=("https://softwareperonista.com.ar/releases/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('4d8d9de49965a44fe67205a5474cdc9326cf4c7eb3bda646e7a61d2d5c0a9602')

build() {
  cd ${pkgname}-${pkgver}

  arch-meson . build

  ninja -C build
}

check () {
  cd ${pkgname}-${pkgver}

  ninja -C build test
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install

  rm -r $pkgdir/usr/share/icons/hicolor/apps
}
