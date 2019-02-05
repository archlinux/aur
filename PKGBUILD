# Maintainer: Thomas Pulzer <t.pulzer@thesecretgamer.de>

pkgname=php72-apcu-bc
_pkgbase="${pkgname#php72-}"
_phpbase="${pkgname/-apcu-bc}"
pkgver=1.0.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='APCu Backwards Compatibility Module'
url='https://pecl.php.net/package/apcu_bc'
depends=("${_phpbase}-apcu")
provides=("php-${_pkgbase}")
license=('PHP')
source=("https://pecl.php.net/get/apcu_bc-${pkgver}.tgz")
md5sums=('054724a6518ced14dd2fb32010819050')

build() {
  cd "${srcdir}/apcu_bc-${pkgver}"
	phpize72
  ./configure --config-cache \
		--sysconfdir="/etc/${_phpbase}" \
		--with-php-config=/usr/bin/php-config72 \
		--localstatedir=/var
	make
}

package() {
  cd "${srcdir}/apcu_bc-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install
}
