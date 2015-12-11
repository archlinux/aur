# Maintainer: Glen Dsouza <glen@teameos.org>
# Contributor: jmf <jmf at mesecons dot net>
pkgname=openscenegraph-git
pkgver=20151212
pkgrel=1
_gitname=osg
pkgdesc="An open source, high performance real-time graphics toolkit - git mirror"
arch=('i686' 'x86_64')
url="http://www.openscenegraph.org/"
license=('GPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver' 'qt5-base' 'ffmpeg-compat' 'mesa')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib' 'qt5-base' 'ffmpeg-compat')
provides=('openscenegraph-git' 'openscenegraph')
conflicts=('openscenegraph' 'openscenegraph-svn')
source=(git://github.com/openscenegraph/osg.git)
md5sums=('SKIP')

pkgver() {
  echo "$(date +"%Y%m%d")"
}

build() {
  mkdir ${srcdir}/${_gitname}-build/
  cd "${srcdir}/${_gitname}-build/"
  cmake ../${_gitname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBRARY_OUTPUT_PATH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release

  make || return 1
}

package(){
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 "${srcdir}/${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  [ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
}

