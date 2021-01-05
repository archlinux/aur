# Maintainer: Rodrigo Lourenço <rzl@rzl.ooo>
_pecl=krb5
pkgname=php-pecl-${_pecl}
pkgver=1.1.4
pkgrel=1
pkgdesc="PHP interface to Kerberos and GSSAPI"
arch=(x86_64)
url="https://pecl.php.net/package/${_pecl}"
license=('MIT')
depends=('krb5')
makedepends=('php')
source=(https://pecl.php.net/get/${_pecl}-${pkgver}.tgz)
sha1sums=('650a094276570c15dbc66d9b38e84b40380a194c')

build() {
	cd "${_pecl}-${pkgver}"
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "${_pecl}-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" install
	install -m0644 -D -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	mkdir -p "${pkgdir}/etc/php/conf.d"
	echo "; extension=${_pecl}.so" >"${pkgdir}/etc/php/conf.d/${_pecl}.ini"
}
