# Maintainer: Breno Ramalho Lemes <breno@br-lemes.net>
pkgname=php-firebird
pkgver=8.1.11
pkgrel=1
pkgdesc='Firebird module for PHP'
arch=('x86_64')
url='http://www.php.net'
license=('PHP')
depends=("php=${pkgver}" 'libfbclient')
source=("https://php.net/distributions/php-${pkgver}.tar.xz"
	'pdo_firebird.ini')
sha256sums=('3005198d7303f87ab31bc30695de76e8ad62783f806b6ab9744da59fe41cc5bd'
	'41187271bb8a552ff10c997bc31557f9f09f47087618fde0c08e3304e204b771')

build() {
	cd ${srcdir}/php-${pkgver}/ext/pdo_firebird
	phpize
	./configure --with-pdo-firebird=/usr/lib/php/modules
	make
}

package() {
	mkdir -p "$pkgdir"/{/usr/lib/php/modules,/etc/php/conf.d}
	install -m755 "$srcdir/php-$pkgver/ext/pdo_firebird/.libs/pdo_firebird.so" "$pkgdir/usr/lib/php/modules"
	install -m644 "$srcdir/pdo_firebird.ini" "$pkgdir/etc/php/conf.d"
}
