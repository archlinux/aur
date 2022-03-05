# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=php-xmlrpc
_extname=xmlrpc
pkgver=1.0.0RC3
pkgrel=1
pkgdesc="PHP extension to write XML-RPC servers and clients"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/xmlrpc"
license=('PHP')
depends=('glibc' 'libxml2')
makedepends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
sha256sums=('65ce03491782f9d9d5e9bc70bfe684255e5afa8486a2960c7a7cab033882a282')

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
