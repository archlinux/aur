# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=simgear-git
pkgver=2018.4.0r5098.6d89cc6c
_pkgver=2018.4.0
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="http://home.flightgear.org/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost' 'cmake' 'mesa')
provides=('simgear=2018.4.0')
conflicts=('simgear')
options=('staticlibs')
source=("simgear::git+https://git.code.sf.net/p/flightgear/simgear#branch=next")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%sr%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DSIMGEAR_SHARED:BOOL="ON" \
    .
  make
}

package(){
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install
}

