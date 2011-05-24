# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-yaml
_extname=yaml
pkgver=1.0.1
pkgrel=1
pkgdesc="Support for YAML 1.1 (YAML Ain't Markup Language) serialization using the LibYAML library."
arch=("i686" "x86_64")
url="http://code.google.com/p/php-yaml/"
license=('MIT')
depends=('php' 'libyaml')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
md5sums=('d8a965479d919e1526dd43295783c7f7')

build() {
	cd "$srcdir/$_extname-$pkgver"

	phpize
	./configure
	make

	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

# vim:set ts=2 sw=2 et:
