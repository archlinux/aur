# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

_pkgname=trader
pkgname=php-${_pkgname}
pkgver=0.5.1
pkgrel=1
pkgdesc="Technical Analysis for traders"
license=('BSD 2-clause')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_pkgname}"
depends=('php>=5.3')
backup=("etc/php/conf.d/${_pkgname}.ini")
install=php-${_pkgname}.install
source=("https://pecl.php.net/get/${_pkgname}-${pkgver}.tgz")
sha512sums=('f96356959759b2cda43367f3892c90b19f15e474821388ca99ecd68b8655cae44f040482671eb9cd035f7fe88ffdd6dabdff611fa95c71c0d67fa3e191ae8dbc')

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
