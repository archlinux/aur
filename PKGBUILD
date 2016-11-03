# Maintainer: Alexander Sobolevkiy <smak.nsk@gmail.com>

pkgname=php-stats
pkgver=2.0.3
pkgrel=1
pkgdesc="PHP extension for Stats"
license=('PHP')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/stats"
depends=('php>=7.0.0')
source=("http://pecl.php.net/get/stats-$pkgver.tgz")
sha512sums=('68a21296f8892c399d961bc1bba31cb6ebf6e0533fd396fc8527a33aa0b7cc189e718bd22dddbaaaeda183488971f02e87b2d9514085cc2a3d0fc558921a584c')

build() {
	cd "$srcdir/stats-$pkgver"

	phpize || return 1
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "$srcdir/stats-$pkgver"

	make INSTALL_ROOT="$pkgdir" install
	echo ';extension=stats.so' > stats.ini
	install -D -m644 stats.ini "$pkgdir/etc/php/conf.d/stats.ini"
}