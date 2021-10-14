# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

pkgname=php-gmagick
pkgver=2.0.6RC1
pkgrel=1
pkgdesc="PHP extension for GMagick"
license=('PHP')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/gmagick"
depends=(
	'php>=7.0.1'
	'graphicsmagick>=1.3.20'
	)
backup=('etc/php/conf.d/gmagick.ini')
install=php-gmagick.install
source=("http://pecl.php.net/get/gmagick-$pkgver.tgz")
sha512sums=('c09ad751815d06964f16ab95025badc0711ceaaac0cf79035307aa75f2730b021b070d0e45e549ddd5447de68581ec666a817ec5c05a2a4557d4c1548216714f')

build() {
	cd "$srcdir/gmagick-$pkgver"

	phpize || return 1
	./configure --prefix=/usr
	make || return 1
	}

package() {
	cd "$srcdir/gmagick-$pkgver"

	make INSTALL_ROOT="$pkgdir" install
	echo ';extension=gmagick.so' > gmagick.ini
	install -D -m644 gmagick.ini "$pkgdir/etc/php/conf.d/gmagick.ini"
	}
