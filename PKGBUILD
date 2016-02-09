# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

pkgname=php-gmagick
pkgver=2.0.1RC3
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
sha512sums=('b83eb083998a8c6717c0d60bce49fc246d6ecc7389eb6ce667ffe7eb2fb7a2500735a925fc5142da8d636e2dc62ba41c56ebfaa0e2f29b2155d7af8229ab81fa')

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
