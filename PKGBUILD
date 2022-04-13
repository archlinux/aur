# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php7-yaml
_extname=yaml
pkgver=2.2.2
pkgrel=1
pkgdesc="Support for YAML 1.1 (YAML Ain't Markup Language) serialization using the LibYAML library."
arch=("i686" "x86_64")
url="http://bd808.com/pecl-file_formats-yaml/"
license=('MIT')
depends=('php' 'libyaml')
backup=("etc/php7/conf.d/$_extname.ini")
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('119052f0461d57d86f44c252f9c9b2dd743486c701c1a0aba0aebecdd0d8b82a')

build() {
	cd "$srcdir"/$_extname-$pkgver
	phpize7
	./configure
	make
}

package() {
	cd "$srcdir"/$_extname-$pkgver
	install -m0755 -d "$pkgdir"/etc/php7/conf.d/
	install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	echo "extension=$_extname.so" > "$pkgdir"/etc/php7/conf.d/$_extname.ini
	chmod 0644 "$pkgdir"/etc/php7/conf.d/$_extname.ini
	install -m0755 -D ".libs/$_extname.so" "$pkgdir"$(php-config7 --extension-dir)/$_extname.so
}
