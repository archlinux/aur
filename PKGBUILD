# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=virtualsmartcard-git
_gitname=virtualsmartcard
pkgver=0
pkgrel=1
pkgdesc="Virtual Smart Card emulates a smart card and makes it accessible through PC/SC"
url="http://sourceforge.net/projects/vsmartcard/"
arch=('i686' 'x86_64')
license=( "GPLv3" )
conflicts=( $_gitname )
provides=( $_gitname )
depends=( "pcsclite"  )
makedepends=( "help2man" )
source=( "$_gitname::git+http://git.code.sf.net/p/vsmartcard/git" )
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir"/$_gitname/virtualsmartcard
  autoreconf --verbose --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$_gitname/virtualsmartcard
  make DESTDIR="$pkgdir" install
}
