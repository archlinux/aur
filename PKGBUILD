# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-oauth
_extname=oauth
pkgver=2.0.4
pkgrel=1
pkgdesc="PHP extension to provide OAuth consumer and provider bindings."
arch=("i686" "x86_64")
url="http://www.php.net/manual/en/intro.oauth.php"
license=('BSD')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('6180266f63afdcaca2f6c8221bd865443175cd4317763a4141909723dd1e5c15')
backup=("etc/php/conf.d/$_extname.ini")

build() {
	cd "$srcdir/$_extname-$pkgver"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install

	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
}
