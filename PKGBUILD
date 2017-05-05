# Maintainer: Alex Smith <azphreal19@protonmail.com
pkgname=koel
pkgver=3.6.2
pkgrel=2
pkgdesc="A personal music streaming server that works."
arch=('any')
url="http://koel.phanan.net/"
license=('MIT')
depends=('php' 'python3')
makedepends=('php-composer')
optdepends=('php-pgsql: to use the PostGreSQL database backend'
            'php-sqlsrv: to use the Microsoft SQL database backend'
            'mariadb: to use the MySQL database backend'
            'postgresql: to use the PostGreSQL database backend')

backup=('usr/share/webapps/koel/.env')
install="${pkgname}.install"
source=("https://github.com/phanan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7fddfa7014b0da2c6bc14f0ce83982dfb23991834dd6c453b07922104687b333')

build() {
	cd "$pkgname-$pkgver"
    COMPOSER_CACHE_DIR="${srcdir/composer}" composer install
}

package() {
	#cd "$pkgname-$pkgver"
	mkdir -p "${pkgdir}/usr/share/webapps"
    cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"
}
