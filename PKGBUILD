# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Marcel Novotny <marcel.novotny@certicon.cz>
# Contributor: Atsutane <darkandevil@hotmail.de>
# Contributor: Clemens Novak <e0025574@student.tuwien.ac.at>

pkgname=fbdesk
pkgver=1.4.1
pkgrel=3
pkgdesc="Fluxbox Utility for creating and managing Icons on a Fluxbox Desktop"
url="http://fluxbox.org/fbdesk/"
license=('GPL')
depends=('libxft' 'imlib2' 'libxpm')
arch=('i686' 'x86_64')
changelog=ChangeLog
source=(http://fluxbox.sourceforge.net/download/$pkgname-$pkgver.tar.gz
	$pkgname-$pkgver-gcc43.patch
	$pkgname-$pkgver-options.patch)
md5sums=('b65136d2d52524492c8a5bc233b7f34b'
         '6c0730137cb50185d4c6d88f69553d2d'
         '7cc0f132b43dd7fcdf9daac798eb7275')

build() {
  cd "$srcdir/fbdesk-$pkgver"
  patch -p1 <../$pkgname-$pkgver-gcc43.patch || return 1
  patch -p1 <../$pkgname-$pkgver-options.patch || return 1
  ./configure --prefix=/usr --disable-png || return 1
  make
}
package() {
  cd "$srcdir/fbdesk-$pkgver"
  make DESTDIR="$pkgdir" install
}
