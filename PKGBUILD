# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xfractint  
pkgver=20.04p14
pkgrel=2
pkgdesc="A fractal generator wellknown from good old DOS days"
url="http://www.fractint.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft')
makedepends=('yasm')
source=(fractint.sh \
http://www.fractint.org/ftp/current/linux/$pkgname-$pkgver.tar.gz)
md5sums=('90a680dbcee2063e05c2e9c0b235649d'
         '0e997a83e92fd1119d09a97351f9f788')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's+lib64+lib+' Makefile 
  sed -i 's+/usr/bin/install+install+' Makefile 
  make PREFIX=/usr AS=yasm fractint 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/usr install
  install -Dm755 $srcdir/fractint.sh $pkgdir/etc/profile.d/xfractint.sh 
}
