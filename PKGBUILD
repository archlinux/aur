# Maintainer: Daniil Gentili <daniil@daniil.it>

pkgname=php-ev
_extname=ev
pkgver=1.2.2
pkgrel=1
pkgdesc="PHP extension for interface to libev library"
arch=(any)
url="https://bitbucket.org/osmanov/pecl-ev"
license=('New BSD')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
packager="Daniil Gentili <daniil@daniil.it>"

sha512sums=('b794dfedc5ad0485b9674d5c7f6f20da1385338bdcec84dcea2e984fc6c0453895da8a2728fb9ae95c6f7c6a89273ba3c031688b5b897558ad561c2340bfa280')

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

