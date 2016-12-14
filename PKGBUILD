# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-swoole
_extname=swoole
pkgver=1.9.1
pkgrel=1
pkgdesc="Event-driven asynchronous and concurrent networking engine with high performance for PHP."
arch=("i686" "x86_64")
url="https://github.com/swoole/swoole-src"
license=('Apache2.0')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
packager="吕海涛 <aur@lvht.net>"

build() {
	cd "$srcdir/$_extname-$pkgver"
	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

sha256sums=('eca7e151e15687d36741c1ecbd532624f7e394ede57ed8418296648c296c28a0')
