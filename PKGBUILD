# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-swoole
_extname=swoole
pkgver=2.0.6
pkgrel=1
pkgdesc="Event-driven asynchronous and concurrent networking engine with high performance for PHP."
arch=("i686" "x86_64")
url="https://github.com/swoole/swoole-src"
license=('Apache')
depends=('nghttp2')
makedepends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
packager="吕海涛 <aur@lvht.net>"

build() {
	cd "$srcdir/$_extname-$pkgver"
	phpize
	./configure --enable-http2 --enable-openssl --enable-coroutine
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo ";extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

sha256sums=('9d8a7fe2060e1feb5b4b65ff64ad30283f1b99b7107129e5f55f66d1319943e9')
