# Maintainer: Jordan Christiansen <xordspar0@gmail.com>
pkgname=liberal-crime-squad-svn
_reponame=lcsgame
pkgver=r864
pkgrel=1
pkgdesc="A satirical console-based political role-playing/strategy game"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/lcsgame/"
license=('GPL2')
depends=('ncurses')
makedepends=('subversion')
source=($_reponame::'svn+https://svn.code.sf.net/p/lcsgame/code/trunk')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_reponame"

  chmod 744 bootstrap
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_reponame"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
