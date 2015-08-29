# Maintainer: jmf <jmf at mesecons dot net>
pkgname=openscenegraph-git
pkgver=20150829
pkgrel=1
_gitname=osg
pkgdesc="An open source, high performance real-time graphics toolkit - git mirror"
arch=('i686' 'x86_64')
url="http://www.openscenegraph.org/"
license=('GPL')
groups=()
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl')
makedepends=()
provides=('openscenegraph-git')
conflicts=('openscenegraph' 'openscenegraph-svn')
source=(git://github.com/openscenegraph/osg.git)
md5sums=('SKIP')

build() {
	mkdir ${srcdir}/${_gitname}-build/
  cd "${srcdir}/${_gitname}-build/"
  cmake ../${_gitname} -DCMAKE_INSTALL_PREFIX=/usr -DLIBRARY_OUTPUT_PATH=/usr/lib -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package(){
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}

