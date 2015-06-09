# Contributor: Danibspi danibspi <at> gmail <dot> com
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=cunit
pkgver=2.1.3
pkgrel=2
pkgdesc="Lightweight system for writing, administering, and running unit tests in C"
arch=(i686 x86_64)
url="http://cunit.sourceforge.net/"
license=('LGPL2')
depends=('glibc')
options=('!libtool')
source=(https://downloads.sourceforge.net/project/cunit/CUnit/2.1-3/CUnit-2.1-3.tar.bz2)
md5sums=('b5f1a9f6093869c070c6e4a9450cc10c')

build() {
  cd "$srcdir/CUnit-2.1-3"
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/CUnit-2.1-3"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/doc $pkgdir/usr/share/doc
}



