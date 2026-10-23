# Maintainer: Tomasz Gruszka <tompear79@gmail.com>

_phpversion=82
pkgname=php${_phpversion}-pdo_sqlsrv
pkgver=5.13.3
pkgrel=1
pkgdesc="Microsoft SQL Server PDO Drivers for PHP 8.2"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/pdo_sqlsrv"
license=('MIT')
depends=("php${_phpversion}" "php${_phpversion}-pdo" "msodbcsql")
source=("https://pecl.php.net/get/pdo_sqlsrv-${pkgver}.tgz")
sha256sums=('198a7b37da0658d36a93d158a0ec179b137b3a4d241c90a6650ae9ee8f91ec4a')
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
