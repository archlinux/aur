# Contributor: Pavol Hluchy (Lopo) <lopo@losys.eu>

pkgname=php-gmagick
pkgver=1.1.7RC3
pkgrel=1
pkgdesc="PHP extension for GMagick"
license=('PHP')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/gmagick"
depends=(
	'php>=5.1.3'
	'graphicsmagick>=1.2.6'
	)
backup=('etc/php/conf.d/gmagick.ini')
install=php-gmagick.install
source=("http://pecl.php.net/get/gmagick-$pkgver.tgz")
sha512sums=('a51f148dc16322bcd5586b4af059389159edab1de4ada5743a5ef6dd8d4f001a21f955dc8fd2dac2969a5048db89e3b8031da3a2f519d59fcb1f8e6afa4d8dd9')

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
