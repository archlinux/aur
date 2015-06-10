# Maintainer: celsius <chris@opensuse.us>
pkgname=cmdiag
pkgver=0.2
pkgrel=1
pkgdesc="Docsis cable modem diagnostic"
arch=('i686' 'x86_64')
url="http://cmdiag.sourceforge.net/"
license=('GPL')
depends=('net-snmp')
makedepends=()
optdepends=()
provides=("cmdiag=$pkgver")
conflicts=()
replaces=()
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz cmdiag.cpp.patch)
md5sums=('e1bde5ef9d1c0f976f4cfe0af990d4e8' '0ea5b066687e07db5c8551f82c819301')

build() {
  cd "$srcdir/$pkgname-$pkgver"
 
  patch --verbose -p0 < $srcdir/cmdiag.cpp.patch
  
  sed -i 's|\PREFIX = /usr/sbin|\PREFIX = /usr/bin|' Makefile

  sed -i 's|\install $(EXEC) $(PREFIX)|\ |' Makefile

  make clean
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  cp -a $pkgname $pkgdir/usr/bin/$pkgname
  make DESTDIR="$pkgdir/" install
}
