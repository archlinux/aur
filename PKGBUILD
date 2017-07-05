# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

_pkgname=trader
pkgname=php-${_pkgname}
pkgver=0.4.0
pkgrel=1
pkgdesc="Technical Analysis for traders"
license=('BSD 2-clause')
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_pkgname}"
depends=('php>=5.3')
backup=("etc/php/conf.d/${_pkgname}.ini")
install=php-${_pkgname}.install
source=("http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz")
sha512sums=('0a7d2209378d94362f1b24ad5f4c8d8b7077b7e33703f31fb1fddd8ce872f36e63a52a47bd9068b2993b008457349e4e0ecb9091ad2cb1109fad5d8eb9a9470d')

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
