# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Thomas Pulzer <t.pulzer@thesecretgamer.de>
_phpversion=73
pkgname=php${_phpversion}-apcu-bc
pkgver=1.0.5
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='APCu Backwards Compatibility Module'
url='https://pecl.php.net/package/apcu_bc'
depends=("php${_phpversion}-apcu")
provides=("php-apcu-bc")
license=('PHP')
source=("https://pecl.php.net/get/apcu_bc-${pkgver}.tgz")
sha256sums=('40d8e44dbbb6fc3fc019824683d215717413633e5f0a70d34cfa8a09bd064055')

build() {
  cd "${srcdir}/apcu_bc-${pkgver}"
	phpize${_phpversion}
  ./configure --config-cache \
		--sysconfdir="/etc/php${_phpversion}" \
		--with-php-config=/usr/bin/php-config${_phpversion} \
		--localstatedir=/var
	make
}

package() {
  cd "${srcdir}/apcu_bc-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install
}
