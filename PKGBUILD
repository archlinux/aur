# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

_pkgname=trader
pkgname=php-${_pkgname}
pkgver=0.5.0
pkgrel=1
pkgdesc="Technical Analysis for traders"
license=('BSD 2-clause')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_pkgname}"
depends=('php>=5.3')
backup=("etc/php/conf.d/${_pkgname}.ini")
install=php-${_pkgname}.install
source=("http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz")
sha512sums=('782146786f550227a352ab7d1b6775908c984e00c433930476c51af56f3830177f1b1e6d84a38399d5d7808428687733c323e508314e87a05d2916bf564695fa')

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
