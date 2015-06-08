# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=dibbler
pkgver=0.8.4
pkgrel=1
pkgdesc="Dibbler, a portable DHCPv6"
arch=('i686' 'x86_64')
url="http://klub.com.pl/dhcpv6/"
license=('GPL')
conflicts=('dibbler-git')
source=(http://klub.com.pl/dhcpv6/$pkgname/$pkgname-$pkgver.tar.gz
	dibbler-client.service)
md5sums=('549e7fa6d3eccb2d4af7b6fb2dcf64ed'
         'b81c49eedad6eb98a451f1e2d5d581fc')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  mkdir -p $pkgdir/var/lib/dibbler
  mkdir -p $pkgdir/etc/dibbler
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/dibbler-client.service $pkgdir/usr/lib/systemd/system
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
