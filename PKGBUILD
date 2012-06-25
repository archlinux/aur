# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-oauth
_extname=oauth
pkgver=1.2.2
pkgrel=1
pkgdesc="PHP extension to provide OAuth consumer and provider bindings."
arch=("i686" "x86_64")
url="http://www.php.net/manual/en/intro.oauth.php"
license=('BSD')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
md5sums=('9a9f35e45786534d8580abfffc8c273c')

build() {
	cd "$srcdir/$_extname-$pkgver"

	phpize
	./configure
	make

	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

# vim:set ts=2 sw=2 et:
