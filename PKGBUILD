# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=php-amqp
_extname=amqp
pkgver=1.9.4
pkgrel=1
pkgdesc="PHP extension compatible with AMQP 0-9-1 message brokers"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/amqp"
license=('PHP')
depends=('glibc' 'librabbitmq-c')
makedepends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
sha256sums=('b66b8b8264749cb7a69ae4d09665dad1559b6c4f01430206c8e4187bcd8c782d')

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
