# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=polyorb
pkgver=2014
pkgrel=1
pkgdesc="PolyOrb provides the Distributed Systems Annex (DSA) to build distributed applications with Ada."

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/polyorb"
license=('GPL')
depends=("gcc-ada")
makedepends=("nawk")

source=(http://downloads.dragonlace.net/src/$pkgname-gpl-$pkgver-src.tar.gz
        patch-Makefile.in)

md5sums=('39df6ccf2d0dd19b250ba662b0b1dc4d'
         'c8142456832b10c7a06343e08ffde222')


build() {
	
  cd $srcdir/$pkgname-$pkgver-src

  patch -p0 -i ../patch-Makefile.in

  ./configure --prefix=/usr  --with-appli-perso="dsa"  --with-proto-perso="giop"
  make
}


package() {
  cd $srcdir/$pkgname-$pkgver-src

  DESTDIR=$pkgdir make install 
}
