# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=pace
pkgver=0.8.0
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/softwareperonista/pace'
depends=('gtksourceview4')
makedepends=('meson' 'vala')
source=("https://gitlab.com/softwareperonista/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('43e9a6b6796c348a764460a26d6717505bef667c292cc8bfc8f11edd2d847bea')

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
}
