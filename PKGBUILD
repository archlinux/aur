# Maintainer: oliver < a t > first . in-berlin . de
# Contributor: daltomi (from AUR)
# Contributor: gunnar <tomtinn@gmail.com>
pkgname=trafshow
pkgver=5.2.3
pkgrel=7
pkgdesc="Full screen network monitoring"
arch=('i686' 'x86_64')
url="https://fossies.org/linux/misc/old/"
license=('netbsd')
depends=('libpcap' 'ncurses')
source=(http://fossies.org/linux/misc/old/${pkgname}-$pkgver.tgz trafshow.patch) 
md5sums=('0b2f0bb23b7832138b7d841437b9e182' 'c6f0102c66868a65d93f210c524e7ff9')

build() {
cd $srcdir/$pkgname-$pkgver
patch -p1 -i ../trafshow.patch  || return 1
autoconf -f -Wnone || autoheader -f -Wnone # this ignores tons of warnings
#autoconf -f || autoheader -f # consider using this to get the tons of warnings
./configure --prefix=/usr 
make || return 1
}

package() {
  PKGDIR=$srcdir/$pkgname-$pkgver/../../pkg/$pkgname
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$PKGDIR install
}
