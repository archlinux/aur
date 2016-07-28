# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

pkgname=php-gmagick
pkgver=2.0.4RC1
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
sha512sums=('c8d877ab371fe57e07134bbe09bb24dcf20cd3d6310a212c395c89e27e783cb939c05ff80efdd6c47580ef54e315d75793e5c85c90b11c79796e60315e063916')

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
