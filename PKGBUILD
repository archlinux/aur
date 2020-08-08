# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_project_name=pace
pkgname=${_project_name}-cli
pkgver=1.4.0
pkgrel=1
pkgdesc='A simple pacman.conf CLI editor'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/tarmaciltur/pace'
depends=('glib2')
makedepends=('meson' 'vala' 'git' 'polkit')
optdepends=('polkit')
conflicts=('pace')
provides=('pace')
source=("https://gitlab.com/tarmaciltur/${_project_name}/-/archive/${pkgver}/${_project_name}-${pkgver}.tar.gz")
sha256sums=('e1a954fdc6a5043f95c9d8b2fd68f6a38b79b32ad4a4d65e918e897aa255198f')

build() {
  cd ${_project_name}

  arch-meson . build --wrap-mode=nofallback -Dgui=false

  ninja -C build
}

check () {
  cd ${_project_name}

  ninja -C build test
}

package() {
  cd ${_project_name}

  DESTDIR="$pkgdir" ninja -C build install
}
