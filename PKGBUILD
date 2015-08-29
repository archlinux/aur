# Maintainer: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>
# Contributor: jmf <jmf at mesecons dot net>
pkgname=simgear-git
pkgver=20150829
pkgrel=1
_gitname=simgear
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('i686' 'x86_64')
url="http://simgear.sourceforge.net/"
license=('GPL')
depends=('glut' 'freealut' 'plib' 'openscenegraph-git' 'boost>=1.49')
optdepends=()
makedepends=('git')
provides=('simgear-git')
conflicts=('simgear')
source=(git://git.code.sf.net/p/flightgear/simgear)
md5sums=('SKIP')

build() {
  cd ${srcdir}/${_gitname}
  git checkout next
  mkdir ${srcdir}/${_gitname}-build/
  cd "${srcdir}/${_gitname}-build/"
  cmake ../${_gitname} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package(){
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
}

