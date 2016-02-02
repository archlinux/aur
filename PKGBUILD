# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

pkgname=php-gmagick
pkgver=2.0.1RC2
pkgrel=1
pkgdesc="PHP extension for GMagick"
license=('PHP')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/gmagick"
depends=(
	'php>=7.0.1'
	'graphicsmagick>=1.3.17'
	)
backup=('etc/php/conf.d/gmagick.ini')
install=php-gmagick.install
source=("http://pecl.php.net/get/gmagick-$pkgver.tgz")
sha512sums=('537760e3b5b6d72be33f88d91350509727a767c713fa0ad7c9357d84e28b23a44d482d13518391e084a0b7ca78bc70840ab1aa56a09676d79ed83e77a0feeef6')

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
