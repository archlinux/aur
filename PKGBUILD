# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_project_name=pace
pkgname=${_project_name}-cli
pkgver=1.4.1
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
sha256sums=('69af3b5f70c6f4d4fed96da2fe2365285171785025e34ff564965802be23bcde')

build() {
  cd ${_project_name}-${pkgver}

  arch-meson . build --wrap-mode=nofallback -Dgui=false

  ninja -C build
}

check () {
  cd ${_project_name}-${pkgver}

  ninja -C build test
}

package() {
  cd ${_project_name}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install
}
