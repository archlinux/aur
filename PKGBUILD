# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_project_name=pace
pkgname=${_project_name}-git
pkgver=0.9.0
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/softwareperonista/pace'
depends=('gtksourceview4')
makedepends=('meson' 'vala')
conflicts=('pace')
source=('git+https://gitlab.com/softwareperonista/pace.git')
sha256sums=(SKIP)

pkgver() {
  cd ${_project_name}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_project_name}

  arch-meson . build

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
