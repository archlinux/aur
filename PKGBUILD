# Maintainer: oliver < a t > first . in-berlin . de
# Contributor: gunnar <tomtinn@gmail.com>
pkgname=trafshow
pkgver=5.2.3
pkgrel=5
pkgdesc="Full screen network monitoring"
arch=('i686' 'x86_64')
url="http://soft.risp.ru/trafshow/index_en.shtml"
license=('netbsd')
depends=('libpcap' 'ncurses')
source=(http://fossies.org/linux/misc/old/${pkgname}-$pkgver.tgz trafshow.patch) 
md5sums=('0b2f0bb23b7832138b7d841437b9e182' '4a85997d88dffa27ac469c6429752cb2')

build() {
cd $srcdir/$pkgname-$pkgver
patch -p1 -i ../trafshow.patch  || return 1
./configure --prefix=/usr 
make || return 1
}

package() {
  PKGDIR=$srcdir/$pkgname-$pkgver/../../pkg/$pkgname
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$PKGDIR install
}
