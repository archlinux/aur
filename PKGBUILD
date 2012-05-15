# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-stomp
_extname=stomp
pkgver=1.0.3
pkgrel=3
pkgdesc="PHP stomp client extension"
arch=("i686" "x86_64")
url="http://www.php.net/manual/en/book.stomp.php"
license=('PHP')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz" stomp-php54.patch)
backup=("etc/php/conf.d/$_extname.ini")

build() {
	cd "$srcdir/$_extname-$pkgver"
	patch -p1 -i "$srcdir/stomp-php54.patch"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"

	install -m0755 -d "$pkgdir/etc/php/conf.d/"
# 	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

md5sums=('2451fbfe007c5ce36403332703f9839b'
         'fd6ac50097bdb90d1eecab55b974ab47')
