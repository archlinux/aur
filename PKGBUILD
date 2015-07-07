# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=qtmib
pkgver=1.1.1
pkgrel=1
pkgdesc="Easy-to-use SNMPv1 and SNMPv2c MIB Browser written in QT4"
arch=('i686' 'x86_64')
url="http://qtmib.sourceforge.net/"
license=('GPL2')
depends=('qt4' 'net-snmp')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('1715ae9c88e1f0d355f9a93b3248455e')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  for dir in src/*; do [ -f $dir/*.pro ] && qmake-qt4 -makefile $dir/*.pro -o $dir/Makefile; done
  make all -j
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="" PREFIX="" DESTDIR="$pkgdir/usr/" install
}
