# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
_phpversion=73
pkgname=php${_phpversion}-pdo_sqlsrv
pkgver=5.9.0
pkgrel=1
pkgdesc="Microsoft SQL Server PDO Drivers for PHP"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/pdo_sqlsrv"
license=('MIT')
depends=("php${_phpversion}" 'msodbcsql')
source=("https://pecl.php.net/get/pdo_sqlsrv-${pkgver}.tgz")
sha256sums=('0fce417b33879fdae3d50cc1aa5b284ab12662147ea2206fa6e1fadde8b48c58')
backup=("etc/php${_phpversion}/conf.d/pdo_sqlsrv.ini")

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
	echo 'extension=pdo_sqlsrv.so' > "${pkgdir}/etc/php${_phpversion}/conf.d/pdo_sqlsrv.ini"
	install -Dm0644 "${srcdir}/pdo_sqlsrv-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
