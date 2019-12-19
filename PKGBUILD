# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_project_name=pace
pkgname=${_project_name}-git
pkgver=1.3.1.r5.g96a8346
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/softwareperonista/pace'
depends=('gtksourceview4')
makedepends=('meson' 'vala' 'git')
conflicts=('pace')
provides=('pace')
source=('git+https://gitlab.com/softwareperonista/pace.git')
sha256sums=(SKIP)

pkgver() {
  cd ${_project_name}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_project_name}

  arch-meson --wrap-mode=nofallback . build

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
