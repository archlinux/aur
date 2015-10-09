# Maintainer: Chris Zimmermann <monochromec@gmail.com>
#
pkgname=sinfo
pkgver=0.0.48
pkgrel=4
pkgdesc="A monitoring tool for networked computers."
arch=('i686' 'x86_64' 'armv7h' 'arm')
conflicts=('')
license=('GPL')
depends=('ncurses' 'boost')
source=(http://www.ant.uni-bremen.de/whomes/rinas/sinfo/download/$pkgname-$pkgver.tar.gz sinfod.service)
url="http://www.ant.uni-bremen.de/whomes/rinas/sinfo/"
#
md5sums=('5e92a5c94ff69a68b64b7b776c75d4bf' '5bf5ea9334d10165dfdc2612b6a84688')
#
build() {
  cd ${startdir}/src/$pkgname-$pkgver
  sed -i 's/\-mt//g' sinfo/Makefile.*
  sed -i 's/\-mt//g' sinfod/Makefile.*
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd ${startdir}/src/$pkgname-$pkgver
  make DESTDIR="${pkgdir}/" install
  install -Dm644 $srcdir/sinfod.service $pkgdir/usr/lib/systemd/system/sinfod.service
}  
