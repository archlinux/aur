# Maintainer: Stefan Auditor <stefan@auditor.email>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

_pkgname=php-rdkafka
pkgname=${_pkgname}
pkgver=6.0.3
pkgrel=1
pkgdesc="AProduction-ready, stable Kafka client for PHP"
arch=("i686" "x86_64")
url="https://github.com/arnaud-lb/php-rdkafka"
license=('MIT')
depends=('php' 'librdkafka')
source=("git+https://github.com/arnaud-lb/php-rdkafka")
backup=("etc/php/conf.d/$_extname.ini")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	phpize
	./configure
	make all -j 5
}

package() {
	cd "$srcdir/$_pkgname"
	echo ";extension=${_pkgname}.so" > ${_pkgname}.ini
	install -Dm644 ${_pkgname}.ini "${pkgdir}/etc/php/conf.d/${_pkgname}.ini"
	make install INSTALL_ROOT="${pkgdir}/"
}
