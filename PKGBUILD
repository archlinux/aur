# Maintainer: Daniil Gentili <daniil@daniil.it>

pkgname=php-uv
_extname=uv
pkgver=0.3.0
pkgrel=2
pkgdesc="PHP libuv wrapper"
arch=(any)
url="https://github.com/amphp/ext-uv"
license=('PHP')
depends=('php' 'libuv')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
packager="Daniil Gentili <daniil@daniil.it>"

sha512sums=('f428ee2b75d82f5b841ab11bc388e8ea3552fd110ce278d8950ace74b2a932958b7698446fa13c46ec70a73bd3a29b9fe5035131174580d2c7d0e112fe771940')

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
	echo ";extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

