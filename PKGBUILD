# Maintainer: Tomasz Gruszka <tompear79@gmail.com>

_phpversion=81
pkgname=php${_phpversion}-pdo_sqlsrv
pkgver=5.11.0
pkgrel=1
pkgdesc="Microsoft SQL Server PDO Drivers for PHP"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/pdo_sqlsrv"
license=('MIT')
depends=("php${_phpversion}" "php${_phpversion}-pdo" "msodbcsql")
source=("https://pecl.php.net/get/pdo_sqlsrv-${pkgver}.tgz")
sha256sums=('c307d9bcada02bdc21f59b9f099031b90b30727757bca50fd42fd36159812e8a')
backup=("etc/php${_phpversion}/conf.d/30-pdo_sqlsrv.ini")

build() {
	cd "${srcdir}/pdo_sqlsrv-${pkgver}"
	phpize${_phpversion}
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/pdo_sqlsrv-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" install

	install -dm0755 "${pkgdir}/etc/php${_phpversion}/conf.d"
	echo 'extension=pdo_sqlsrv.so' > "${pkgdir}/etc/php${_phpversion}/conf.d/30-pdo_sqlsrv.ini"
	install -Dm0644 "${srcdir}/pdo_sqlsrv-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
