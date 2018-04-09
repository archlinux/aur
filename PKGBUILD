# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

_pkgname=trader
pkgname=php-${_pkgname}
pkgver=0.4.1
pkgrel=1
pkgdesc="Technical Analysis for traders"
license=('BSD 2-clause')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_pkgname}"
depends=('php>=5.3')
backup=("etc/php/conf.d/${_pkgname}.ini")
install=php-${_pkgname}.install
source=("http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz")
sha512sums=('24972fcfbdccc96c19252d7ec0508c5c45d17dc2cf5434bf57876bd64f66924099ab727cf75ac352cdf1f390d8ba0192f1522b609db4bb68316a58c7688dd7c2')

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	phpize || return 1
	./configure --prefix=/usr
	make || return 1
	}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
	echo ";extension=${_pkgname}.so" > ${_pkgname}.ini
	install -D -m644 ${_pkgname}.ini "${pkgdir}/etc/php/conf.d/${_pkgname}.ini"
	}
