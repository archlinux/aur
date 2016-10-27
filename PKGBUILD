# Maintainer: niris <nirisix at gmail dot com>

pkgname=php53-apcu
pkgver=4.0.11
pkgrel=1
pkgdesc='A userland caching module for PHP'
arch=('i686' 'x86_64')
url='http://pecl.php.net/package/APCu'
license=('PHP')
depends=('php53')
source=("http://pecl.php.net/get/apcu-$pkgver.tgz")
backup=('etc/php/conf.d/apcu.ini')
md5sums=('13c0c0dd676e5a7905d54fa985d0ee62')

build() {
	cd $srcdir/apcu-$pkgver
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/apcu-$pkgver
	make INSTALL_ROOT=$pkgdir install
	echo ';extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini $pkgdir/etc/php/conf.d/apcu.ini
	install -D -m644 apc.php $pkgdir/usr/share/webapps/php53-apcu/apc.php
	install -D -m644 INSTALL $pkgdir/usr/share/doc/php53-apcu/install.txt
}
