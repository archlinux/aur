# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=php-md4c
pkgver=1.1.0
pkgrel=1
pkgdesc="MD4C extension for PHP"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/md4c"
license=('MIT')
depends=('php' 'md4c')
source=("http://pecl.php.net/get/md4c-1.1.tgz")
sha256sums=('ef5f6f76e525a50747f691af2240075efb793a47efc34782a8cee875f13bdee7')

build() {
	cd "$srcdir"/md4c-1.1
	phpize
	./configure --enable-system-libmd4c
	make
}

package() {
	cd "$srcdir"/md4c-1.1
	install -m0755 -d "$pkgdir"/etc/php/conf.d/
	install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	echo "extension=md4c" > "$pkgdir"/etc/php/conf.d/md4c.ini
	chmod 0644 "$pkgdir"/etc/php/conf.d/md4c.ini
	install -m0755 -D ".libs/md4c.so" "$pkgdir"$(php-config --extension-dir)/md4c.so
}
