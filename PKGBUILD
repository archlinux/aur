# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-yaml
_extname=yaml
pkgver=2.0.0
pkgrel=1
pkgdesc="Support for YAML 1.1 (YAML Ain't Markup Language) serialization using the LibYAML library."
arch=("i686" "x86_64")
url="http://bd808.com/pecl-file_formats-yaml/"
license=('MIT')
depends=('php' 'libyaml')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")

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

sha256sums=('ef13ff56c184290c025a522bf9ae2e1b3ecc8543c3a5161dd02adec90897a221')
