# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-txforward
_extname=txforward
pkgver=1.0.7
pkgrel=2
pkgdesc="PHP extension that makes reverse-proxing totally invisible for php applications."
arch=("i686" "x86_64")
url="http://fcartegnie.free.fr/patchs/txforward.html"
license=('PHP')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
sha256sums=('9a6293245984e99a60f1f9d7290a897c86c9c952581d60e137f7d12806e637ba')

build() {
	cd "$srcdir"/$_extname-$pkgver

	phpize
	./configure
	make
}

package() {
	cd "$srcdir"/$_extname-$pkgver
	
	install -m0755 -d "$pkgdir"/etc/php/conf.d/
	echo extension=$_extname.so > "$pkgdir"/etc/php/conf.d/$_extname.ini
	chmod 0644 "$pkgdir"/etc/php/conf.d/$_extname.ini
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)"/$_extname.so
}

# vim:set ts=2 sw=2 et:
