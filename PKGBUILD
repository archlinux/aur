# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-swoole
_extname=swoole
pkgver=1.9.6
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
	./configure --enable-http2 --enable-openssl
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

sha256sums=('b6ad22d6d76c9ad8ad3408854a9ffaa220ae0b02e543fb5a87115452e7429174')
