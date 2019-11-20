# Maintainer: Amish <contact at via dot aur>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-pear
epoch=1
pkgver=1.10.16
pkgrel=1
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='https://pear.php.net/'
depends=('php')
license=('PHP')
source=("install-pear-nozlib-${pkgver}.phar::https://github.com/pear/pearweb_phars/raw/v${pkgver}/install-pear-nozlib.phar"
        "install-pear-nozlib-${pkgver}.phar.sig::https://github.com/pear/pearweb_phars/raw/v${pkgver}/install-pear-nozlib.sig")
backup=('etc/php/pear.conf')
sha256sums=('c3a3130bf4ec5a492d76977d9667c96099b5f8e7833bedd5bff3a9f5529ff419'
            'SKIP')
validpgpkeys=('10F68CF73F8AA426F617752972A321BAC245F175')

package() {
	PHP_PEAR_SYSCONF_DIR=/etc/php \
	INSTALL_ROOT=$pkgdir \
		php -n install-pear-nozlib-${pkgver}.phar \
			-d /usr/share/pear \
			-b /usr/bin

	rm -rf ${pkgdir}{/usr/share/pear/,/}.{channels,depdb,depdblock,filemap,lock,registry}
}
