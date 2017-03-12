# Contributor: cdude <cdude996@hotmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dockboard-svn
pkgver=r152
pkgrel=2
pkgdesc="Outline editor for authors organizing books, articles, and other published works"
url="http://dockboard.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glib' 'libglade' 'enchant' 'aiksaurus')
makedepends=('subversion')
conflicts=('dockboard')
provides=('dockboard')
source=("dockboard::svn://svn.code.sf.net/p/dockboard/code/trunk")
md5sums=('SKIP')
_svnmod=dockboard

pkgver() {
  cd "$srcdir/${_svnmod}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/${_svnmod}"
  LDFLAGS+=$(pkg-config --libs gmodule) ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_svnmod}"
  make DESTDIR=$pkgdir install
}
