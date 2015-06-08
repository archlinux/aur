# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>

_svnmod=osgworks
pkgname=osgworks-svn
pkgver=554
pkgrel=1
pkgdesc="osgWorks is a set of applications and software tools that add capability for OpenSceneGraph software developers"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osgworks/"
license=('LGPL')
depends=('openscenegraph')
makedepends=('subversion' 'cmake')
source=( "$_svnmod::svn+http://osgworks.googlecode.com/svn/trunk/" )
md5sums=("SKIP")


pkgver() {
  cd "$srcdir"/$_svnmod
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_svnmod"
  cmake . -DCMAKE_BUILD_TYPE=Release  -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod"
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr
  mv lib64 lib
}
