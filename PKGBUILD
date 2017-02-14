# Maintainer: Alex Smith <azphreal19@protonmail.com
pkgname=koel
pkgver=3.5.5
pkgrel=2
pkgdesc="A personal music streaming server that works."
arch=('any')
url="http://koel.phanan.net/"
license=('MIT')
depends=('php' 'python3')
makedepends=('php-composer')
optdepends=('php-mysql: to use the MySQL database backend'
            'php-pgsql: to use the PostGreSQL database backend'
            'php-sqlsrv: to use the Microsoft SQL database backend'
            'mariadb: to use the MySQL database backend'
            'postgresql: to use the PostGreSQL database backend')

backup=('usr/share/webapps/koel/.env')
install="${pkgname}.install"
source=("https://github.com/phanan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('efd30b73a2df1fa8f97ef29eaadfdc2b5ba0f08a8aaf0a91826751e03eaed3bf')

build() {
	cd "$pkgname-$pkgver"
    COMPOSER_CACHE_DIR="${srcdir/composer}" composer install
}

package() {
	#cd "$pkgname-$pkgver"
	mkdir -p "${pkgdir}/usr/share/webapps"
    cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"
}
