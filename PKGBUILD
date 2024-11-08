# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-yaml
_extname=yaml
pkgver=2.2.4
pkgrel=1
pkgdesc="Support for YAML 1.1 (YAML Ain't Markup Language) serialization using the LibYAML library."
arch=("i686" "x86_64")
url="http://bd808.com/pecl-file_formats-yaml/"
license=('MIT')
depends=('php' 'libyaml')
backup=("etc/php/conf.d/$_extname.ini")
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('8eb353baf87f15b1b62ac6eb71c8b589685958a1fe8b0e3d22ac59560d0e8913')

build() {
	cd "$srcdir"/$_extname-$pkgver
	phpize
	./configure
	make
}

package() {
	cd "$srcdir"/$_extname-$pkgver
	install -m0755 -d "$pkgdir"/etc/php/conf.d/
	install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	echo "extension=$_extname.so" > "$pkgdir"/etc/php/conf.d/$_extname.ini
	chmod 0644 "$pkgdir"/etc/php/conf.d/$_extname.ini
	install -m0755 -D ".libs/$_extname.so" "$pkgdir"$(php-config --extension-dir)/$_extname.so
}
