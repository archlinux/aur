# Maintainer: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Tomasz Gruszka <tompear79@gmail.com>

_extname=pdo_sqlsrv
_phpversion=7
pkgname="php${_phpversion}-${_extname}"
pkgver=5.10.1
pkgrel=1
pkgdesc='Microsoft SQL Server PDO Drivers for PHP 7'
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('MIT')
depends=("php${_phpversion}" 'msodbcsql')
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('c7854196a236bc83508a346f8c6ef1df999bc21eebbd838bdb0513215e0628ad')
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
