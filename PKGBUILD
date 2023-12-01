# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=php-amqp
_extname=amqp
pkgver=2.1.1
pkgrel=1
pkgdesc="PHP extension compatible with AMQP 0-9-1 message brokers"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/amqp"
license=('PHP')
depends=('librabbitmq-c')
makedepends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
sha256sums=('c9b36f10c2e7b7da472440e21c35655c3bf41983b99bf1e438eac7d5bb1c2b45')

build() {
	cd "$srcdir/$_extname-$pkgver"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"

	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	echo ";extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
