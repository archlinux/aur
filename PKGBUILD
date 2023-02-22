# Maintainer: Tomasz Gruszka <tompear79@gmail.com>

pkgname=php81-amqp
_extname=amqp
pkgver=1.11.0
pkgrel=1
pkgdesc="PHP 8.1 extension compatible with AMQP 0-9-1 message brokers"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/amqp"
license=('PHP')
depends=('glibc' 'librabbitmq-c')
makedepends=('php81')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php81/conf.d/30-$_extname.ini")
sha256sums=('dc5212b4785f59955118a219bbfbcedb7aa6ab2a91e8038a0ad1898f331c2f08')

build() {
	cd "$srcdir/$_extname-$pkgver"

	phpize81
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"

	install -m0755 -d "$pkgdir/etc/php81/conf.d/"
	echo ";extension=$_extname.so" > "$pkgdir/etc/php81/conf.d/30-$_extname.ini"
	chmod 0644 "$pkgdir/etc/php81/conf.d/30-$_extname.ini"
	install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config81 --extension-dir)/$_extname.so"
}
