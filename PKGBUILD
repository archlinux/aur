# Maintainer: Breno Ramalho Lemes <breno@br-lemes.net>
pkgname=php-firebird
pkgver=8.2.2
pkgrel=1
pkgdesc='Firebird module for PHP'
arch=('x86_64')
url='http://www.php.net'
license=('PHP')
depends=("php=${pkgver}" 'libfbclient')
source=("https://php.net/distributions/php-${pkgver}.tar.xz"
	'pdo_firebird.ini')
sha256sums=('bdc4aa38e652bac86039601840bae01c0c3653972eaa6f9f93d5f71953a7ee33'
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
