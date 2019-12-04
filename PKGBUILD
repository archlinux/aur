# Maintainer: nepda <aur@nepda.eu>
pkgname="php-pdo-firebird"
pkgver=7.4.0
pkgrel=1
pkgdesc="Firebird PHP PDO extension"
arch=("i686" "x86_64")
url="http://www.php.net"
license=("PHP")
depends=("php" "libfbclient")
source=("http://www.php.net/distributions/php-${pkgver}.tar.bz2"
        "pdo_firebird.ini")
md5sums=("366b172daecb6a08c89ee014c75d3e72"
         "4a23b02aaa079d4419dad09b41b1f3a2")

build() {
	cd ${srcdir}/php-${pkgver}/ext/pdo_firebird
	phpize
	./configure --with-pdo-firebird=/opt/firebird
	make
}

package() {
	mkdir -p "$pkgdir"/{/usr/lib/php/modules,/etc/php/conf.d}
	install -m755 "$srcdir/php-$pkgver/ext/pdo_firebird/.libs/pdo_firebird.so" "$pkgdir/usr/lib/php/modules"
	install -m644 "$srcdir/pdo_firebird.ini" "$pkgdir/etc/php/conf.d"
}
