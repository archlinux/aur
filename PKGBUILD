# Maintainer:  Markus Hansmair <archlinux at zendro dot de>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>

pkgname=php-legacy-yaml
_extname=yaml
pkgver=2.3.0
pkgrel=1
pkgdesc="Support for YAML 1.1 (YAML Ain't Markup Language) serialization using the LibYAML library."
arch=('x86_64')
url="https://bd808.com/pecl-file_formats-yaml/"
license=('MIT')
depends=('php-legacy' 'libyaml')
backup=("etc/php-legacy/conf.d/$_extname.ini")
source=("https://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('bc8404807a3a4dc896b310af21a7f8063aa238424ff77f27eb6ffa88b5874b8a')

build() {
	cd "$srcdir/$_extname-$pkgver"
	phpize-legacy
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"
	install -m0755 -d "$pkgdir/etc/php-legacy/conf.d/"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	echo ";extension=$_extname" > "$pkgdir/etc/php-legacy/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php-legacy/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config-legacy --extension-dir)/$_extname.so"
}
