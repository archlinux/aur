# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=php71-apcu-bc
pkgver=1.0.4
pkgrel=2
arch=('x86_64')
pkgdesc='APCu Backwards Compatibility Module'
url='https://pecl.php.net/package/apcu_bc'
depends=('php71-apcu')
provides=('php-apcu-bc')
license=('PHP')
source=("https://pecl.php.net/get/apcu_bc-${pkgver}.tgz")
md5sums=('054724a6518ced14dd2fb32010819050')

_optdir=/opt/php71

build() {
	cd ${srcdir}/apcu_bc-${pkgver}

	${_optdir}/usr/bin/phpize
	./configure \
    --prefix=${_optdir}/usr \
    --with-php-config=${_optdir}/usr/bin/php-config

	make
}

check() {
	cd ${srcdir}/apcu_bc-${pkgver}

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	export SKIP_SLOW_TESTS=1

	${_optdir}/usr/bin/php -n run-tests.php -n -P -d extension=apcu.so -d extension=modules/apc.so
}

package() {
	cd ${srcdir}/apcu_bc-${pkgver}

	make INSTALL_ROOT=${pkgdir} install
}
