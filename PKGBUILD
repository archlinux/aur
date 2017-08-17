# Maintainer:  Andrew Shelyakov <andrew.shelyakov@ya.ru>

pkgname=php-pecl-pthreads
pkgver=3.1.6
pkgrel=2
pkgdesc="PHP PECL extension for Threading API"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/pthreads"
license=('BSD')
depends=('php-zts' 'php-pear')
source=("http://pecl.php.net/get/pthreads-${pkgver}.tgz")
sha256sums=('bb13da909a7a7ae1f9e499166103a2d24628993238ce03a8aae3eaa492c0b736')

build() {
	cd "${srcdir}/pthreads-${pkgver}"

	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/pthreads-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
	echo 'extension=pthreads.so' > pthreads.ini

	install -Dm644 "pthreads.ini" "${pkgdir}/etc/php/conf.d/pthreads.ini"
	install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
