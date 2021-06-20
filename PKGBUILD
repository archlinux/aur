# Maintainer: Daniil Gentili <daniil@daniil.it>

pkgname=php-ev
_extname=ev
pkgver=1.1.2
pkgrel=1
pkgdesc="PHP extension for interface to libev library"
arch=("i686" "x86_64")
url="https://bitbucket.org/osmanov/pecl-ev"
license=('New BSD')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
packager="Daniil Gentili <daniil@daniil.it>"

sha512sums=('a2cbc774b099666a4f4c73f1ded900b15e974d5f3e138cc1b7452aee0655aa50b790ca820a3603dbe8c82077fdfbce73970e6fc7709f70a178dc94dd82ebb384')

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

