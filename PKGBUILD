# Maintainer: Tomasz Gruszka <tompear79@gmail.com>

_phpversion=84
pkgname=php${_phpversion}-pdo_sqlsrv
pkgver=5.13.0
pkgrel=1
pkgdesc="Microsoft SQL Server PDO Drivers for PHP 8.4"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/pdo_sqlsrv"
license=('MIT')
depends=("php${_phpversion}" "php${_phpversion}-pdo" "msodbcsql")
source=("https://pecl.php.net/get/pdo_sqlsrv-${pkgver}.tgz")
sha256sums=('efa859bcc48d97f25268dbdebf1db25f25610d7fa36b3ee91073c1c99411e24c')
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
