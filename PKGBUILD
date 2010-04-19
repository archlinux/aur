# Maintainer:
# Contributor: Judd Vinet <judd@archlinux.org>

pkgname=bridge-utils
pkgver=1.4
pkgrel=3
pkgdesc="Utilities for configuring the Linux ethernet bridge"
arch=('i686' 'x86_64')
url="http://www.linuxfoundation.org/en/Net:Bridge"
license=('GPL2')
backup=('etc/conf.d/bridges')
depends=('glibc')
source=(http://downloads.sourceforge.net/bridge/bridge-utils-$pkgver.tar.gz \
	bridges.conf.d)
md5sums=('0182fcac3a2b307113bbec34e5f1c673'
         'f5d691282653580dd5fd4a1092ef365b')

build() {
  cd $srcdir/$pkgname-$pkgver
  aclocal
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
   
  # install config file
  install -Dm644 $srcdir/bridges.conf.d $pkgdir/etc/conf.d/bridges
}
