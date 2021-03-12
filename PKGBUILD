# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=php-xmlrpc
_extname=xmlrpc
pkgver=1.0.0RC2
pkgrel=2
pkgdesc="PHP extension to write XML-RPC servers and clients"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/xmlrpc"
license=('PHP')
depends=('glibc' 'libxml2')
makedepends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
sha256sums=('9800a5f627c24e2f6acf61f816a54c66e9fdffbfabc598ffc0f0f1165d3ef041')

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
