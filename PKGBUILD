# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-markdown
_pkgname=${pkgname#php-}
_extname=discount
pkgver=1.0.0
pkgrel=2
pkgdesc="Support for the markdown language through a modified port of the discount markdown processor"
arch=("i686" "x86_64")
url="http://pecl.php.net/package/markdown"
license=('BSD')
depends=('php')
source=("http://pecl.php.net/get/$_pkgname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
md5sums=('cc8e4575f63c5809dcb62d146a9d04eb')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	install -m0755 -d "$pkgdir/etc/php/conf.d/"
# 	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

# vim:set ts=2 sw=2 et:
