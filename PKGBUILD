# Maintainer: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Tomasz Gruszka <tompear79@gmail.com>

_extname=pdo_sqlsrv
_phpversion=80
pkgname="php${_phpversion}-${_extname}"
pkgver=5.11.0
pkgrel=1
pkgdesc='Microsoft SQL Server PDO Drivers for PHP 8.0'
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('MIT')
depends=("php${_phpversion}" 'msodbcsql')
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('c307d9bcada02bdc21f59b9f099031b90b30727757bca50fd42fd36159812e8a')
backup=("etc/php${_phpversion}/conf.d/${_extname}.ini")

build() {
	cd "${srcdir}/${_extname}-${pkgver}"
	phpize${_phpversion}
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_extname}-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" install

	install -d -m0755 "${pkgdir}/etc/php${_phpversion}/conf.d"
	echo "extension=${_extname}.so" > "${pkgdir}/etc/php${_phpversion}/conf.d/${_extname}.ini"
	install -D -m0644 "${srcdir}/${_extname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
