# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_project_name=pace
pkgname=${_project_name}-cli
pkgver=1.4.2
pkgrel=1
pkgdesc='A simple pacman.conf CLI editor'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/softwareperonista/pace'
depends=('glib2')
makedepends=('meson' 'vala' 'git' 'polkit')
optdepends=('polkit')
conflicts=('pace')
provides=('pace')
source=("https://gitlab.com/softwareperonista/${_project_name}/-/archive/${pkgver}/${_project_name}-${pkgver}.tar.gz")
sha256sums=('abb668d16a1fd3ea6d56fcb925cc5696c28b4cbfc023244630cbe7a57087f574')

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
