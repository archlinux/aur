# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=pace
pkgver=1.4.0
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/softwareperonista/pace'
depends=('gtksourceview4')
makedepends=('meson' 'vala')
source=("https://gitlab.com/tarmaciltur/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e1a954fdc6a5043f95c9d8b2fd68f6a38b79b32ad4a4d65e918e897aa255198f')

build() {
  cd ${pkgname}-${pkgver}

  arch-meson . build --wrap-mode=nofallback

  ninja -C build
}

check () {
  cd ${pkgname}-${pkgver}

  ninja -C build test
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install
}
