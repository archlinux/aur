# Contributor: perlawk
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jacal
pkgver=1c4
pkgrel=1 
pkgdesc="Jacal is a symbolic mathematics system written in the programming language Scheme."
url="http://people.csail.mit.edu/jaffer/JACAL.html"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('scm' 'slib')
install=jacal.install
source=(http://groups.csail.mit.edu/mac/ftpdir/scm/$pkgname-$pkgver.zip)
md5sums=('58e03bd4292a02744728e6f68f48bb41')
options=('!makeflags')

build() {
  export SCHEME_LIBRARY_PATH=/usr/lib/slib/
  cd $srcdir/$pkgname

  ./configure --prefix=/usr --exec-prefix=/usr
  sed -i 's/jacal-$(VERSION).info/jacal.info/g;' Makefile
  
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
  rmdir $pkgdir/usr/share/doc/$pkgname
}

