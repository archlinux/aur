# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=matwm2-svn
_pkgname=matwm2
pkgver=r793
pkgrel=4
pkgdesc="A nice tiling or floating window manager"
arch=('i686' 'x86_64')
url="http://code.google.com/p/segin-utils/"
license=('BSD')
depends=('libxinerama' 'libxft')
makedepends=('svn')
source=("$pkgname::svn+http://segin-utils.googlecode.com/svn/trunk/matwm2"
	"$_pkgname.desktop")
md5sums=('SKIP'
         '8b9993b93fe1d5337b631165db7252c9')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname
  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/xsessions/$_pkgname.desktop"
}

