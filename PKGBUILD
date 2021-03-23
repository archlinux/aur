# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-oauth
_extname=oauth
pkgver=2.0.7
pkgrel=1
pkgdesc="PHP extension to provide OAuth consumer and provider bindings."
arch=("i686" "x86_64")
url="https://www.php.net/manual/en/intro.oauth.php"
license=('BSD')
depends=('php')
source=("https://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('d46f59072f1ade65cf4c4353b7ecf5546d1c56cad602152cb4ba72abb1aa5eec')
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
