# jzip z-code game interpreter for Infocom games

# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=jzip
pkgver=2.1
_dlpkgver=21-10oct2000
pkgrel=7
pkgdesc="Jzip is an interpreter for games in the Infocom Zcode story file format"
url="http://jzip.sourceforge.net/"
depends=(ncurses)
#source=(http://dl.sourceforge.net/$pkgname/$pkgname$_dlpkgver.zip makefile-patch.diff)
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname$_dlpkgver.zip makefile-patch.diff LICENSE)
md5sums=('4c03c95bec15e45477899c12a545fc1d' '1625afeb6da07096571d3ccc964c01af' '54ec2719ddf62fd3805c732f058f1706')
arch=('i686' 'x86_64')
license="custom"

build() {
  cd $startdir/src
  cp unixio.mak Makefile

  # apply patch to makefile
  patch -Np0 < $startdir/src/makefile-patch.diff

  make || return 1
}

package() {
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
