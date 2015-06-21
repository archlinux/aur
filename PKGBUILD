# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Rudolf Olah <omouse@gmail.com>

pkgname=kawa-svn
pkgver=8533
pkgrel=1
pkgdesc="Kawa is a JVM-based Scheme compiler"
url="http://www.gnu.org/software/kawa/"

conflicts=('kawa')
provides=('kawa')
depends=('java-environment')
makedepends=('subversion' 'texinfo')
arch=('i686' 'x86_64')
license=('X11/MIT')

source=()
md5sums=()

_svntrunk=svn://sourceware.org/svn/kawa/trunk
_svnmod=kawa

build() {
  cd $startdir/src
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  cd $startdir/src/$_svnmod
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $startdir/src
  make DESTDIR=$startdir/pkg/ install
}
