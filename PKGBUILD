# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=matwm2-svn
pkgver=r793
pkgrel=3
pkgdesc="A nice tiling or floating window manager"
arch=('i686' 'x86_64')
url="http://code.google.com/p/segin-utils/"
license=('BSD')
depends=('libxinerama' 'libxft')
makedepends=('svn')
source=("$pkgname::svn+http://segin-utils.googlecode.com/svn/trunk/matwm2")
md5sums=('SKIP')

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
}

