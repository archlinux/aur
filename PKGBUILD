# Maintainer:  Markus Hansmair <archlinux at zendro dot de>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>

pkgname=php-legacy-yaml
_extname=yaml
pkgver=2.3.0
pkgrel=2
pkgdesc="Support for YAML 1.1 (YAML Ain't Markup Language) serialization using the LibYAML library."
arch=('x86_64')
url="https://bd808.com/pecl-file_formats-yaml/"
license=('MIT')
depends=('php-legacy' 'libyaml')
backup=("etc/php-legacy/conf.d/$_extname.ini")
source=("https://github.com/php/pecl-file_formats-$_extname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c45de87f7484108c6263643c1cdafc7b0ca5866f9cbfe63638cf154f59aa94f3')

build() {
	cd "$srcdir/pecl-file_formats-$_extname-$pkgver"
	phpize-legacy
	./configure
	make
}

package() {
	cd "$srcdir/pecl-file_formats-$_extname-$pkgver"
	install -m0755 -d "$pkgdir/etc/php-legacy/conf.d/"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	echo ";extension=$_extname" > "$pkgdir/etc/php-legacy/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php-legacy/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config-legacy --extension-dir)/$_extname.so"
}
