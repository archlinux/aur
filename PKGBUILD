# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

pkgname=php-gmagick
pkgver=2.0.1RC1
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
sha512sums=('c59f0888ae45155d5a5812c8a1d79a866a34cf5b370279ecd75fe293099b26818a8ae2017c28174e0960e520a6ae40f8a92773ff7701db0ec1459c0b7db6f0cc')

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
