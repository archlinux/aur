# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=hop-devel  
pkgver=3.0.0_pre16
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="A Software Development Kit for the Web"
url='http://hop.inria.fr'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('bigloo-devel>=7' 'sqlite')
makedepends=('nodejs')
conflicts=('hop')
provides=('hop')
install=hop.install
options=('!makeflags')
source=(ftp://ftp-sop.inria.fr/indes/fp/Hop/hop-${_pkgver}.tar.gz)
md5sums=('430adfe1d32a4895626b30da2fb644ad')

build() {
  cd ${srcdir}/hop-${_pkgver%-2}
  ./configure --prefix=/usr --etcdir=/etc/hop --mandir=/usr/share/man 
  make 
}

package() {
  cd ${srcdir}/hop-${_pkgver%-2}
  make DESTDIR=${pkgdir} install
  cd ${pkgdir}/usr/bin; rm hop; ln -s hop-3.0.0 hop
  install -d $pkgdir/etc/ld.so.conf.d
  echo "/usr/lib/hop/3.0.0/" > $pkgdir/etc/ld.so.conf.d/$pkgname.conf
}

