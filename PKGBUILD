# Maintainer: Glen Dsouza <glen@teameos.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>
pkgname=simgear-git
pkgver=20160415
pkgrel=1
_gitname=simgear
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('i686' 'x86_64')
url="http://simgear.sourceforge.net/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
optdepends=()
makedepends=('boost' 'cmake' 'mesa')
provides=('simgear-git')
conflicts=('simgear')
source=(git://git.code.sf.net/p/flightgear/simgear
        getKern.patch)
md5sums=('SKIP'
         'b4ab9878bbb07555d7fef68b592fb2de')

pkgver() {
  echo "$(date +"%Y%m%d")"
}

prepare() {
  cd ${srcdir}
  patch -p0 -i getKern.patch
}

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

