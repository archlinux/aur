# Maintainer: Daniil Gentili <daniil@daniil.it>

pkgname=php-ev
_extname=ev
pkgver=1.1.5
pkgrel=1
pkgdesc="PHP extension for interface to libev library"
arch=("i686" "x86_64")
url="https://bitbucket.org/osmanov/pecl-ev"
license=('New BSD')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
packager="Daniil Gentili <daniil@daniil.it>"

sha512sums=('7033dc28ff63eca2d0aee44ce0f46da24aa78da4e4f74d3a44e7967bf00fdfcbd6c2fcfce42b8028441bef600267024e5c65955d90aa22578b0850c60c95be6e')

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

