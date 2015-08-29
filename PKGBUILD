# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>
# Contributor: jmf <jmf at mesecons dot net>
pkgname=flightgear-git
pkgver=20150829
pkgrel=1
_gitname=flightgear
pkgdesc="An open-source, multi-platform flight simulator"
arch=('i686' 'x86_64')
url="http://flightgear.org/"
license=('GPL')
depends=('simgear-git' 'libxmu' 'libxi' 'zlib' 'fgdata-git' 'openscenegraph-git')
optdepends=()
makedepends=('boost')
provides=('flightgear-git')
conflicts=('flightgear')
source=(git://git.code.sf.net/p/flightgear/flightgear)
md5sums=('SKIP')

build() {
  cd ${srcdir}/${_gitname}
  git checkout next
  mkdir ${srcdir}/${_gitname}-build/
  cd "${srcdir}/${_gitname}-build/"
  cmake ../${_gitname} -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_QT=1 -DFG_DATA_DIR:STRING="/usr/share/flightgear" -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=Debug
  make || return 1
}

package(){
  cd "$srcdir/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
}

