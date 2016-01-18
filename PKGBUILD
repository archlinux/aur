# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-stomp
_extname=stomp
pkgver=1.0.9
pkgrel=1
pkgdesc="PHP stomp client extension"
arch=("i686" "x86_64")
url="http://www.php.net/manual/en/book.stomp.php"
license=('PHP')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")

build() {
	cd "$srcdir"/$_extname-$pkgver
	phpize
	./configure
	make
}

package() {
	cd "$srcdir"/$_extname-$pkgver

	install -m0755 -d "$pkgdir"/etc/php/conf.d/
# 	install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	echo "extension=$_extname.so" > "$pkgdir"/etc/php/conf.d/$_extname.ini
	chmod 0644 "$pkgdir"/etc/php/conf.d/$_extname.ini
	install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

sha256sums=('7a7d748c6327ef8c6853dcadaedd41b4366ff821b401b11fab7b915cb5246575')
