# Maintainer: Timo Sarawinski <timo AT it-kraut DOT net>

pkgname=php7-gmagick
pkgver=2.0.6RC1 
pkgrel=2 
pkgdesc="PHP 7.4 extension for GMagick"
license=('PHP')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/gmagick"
depends=(
	'php7'
	'graphicsmagick>=1.3.20'
	)
conflicts=('php7-imagick')
backup=('etc/php7/conf.d/gmagick.ini')
install=php7-gmagick.install
source=("http://pecl.php.net/get/gmagick-$pkgver.tgz")
sha512sums=('c09ad751815d06964f16ab95025badc0711ceaaac0cf79035307aa75f2730b021b070d0e45e549ddd5447de68581ec666a817ec5c05a2a4557d4c1548216714f')

build() {
	cd "$srcdir/gmagick-$pkgver"

	phpize7 || return 1
	./configure --with-php-config=/usr/bin/php-config7  --prefix=/usr
	make || return 1
	}

package() {
	cd "$srcdir/gmagick-$pkgver"

	make INSTALL_ROOT="$pkgdir" install
	echo 'extension=gmagick.so' > gmagick.ini
	install -D -m644 gmagick.ini "$pkgdir/etc/php7/conf.d/gmagick.ini"
	}
