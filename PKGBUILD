# Maintainer: Amish <contact at via dot aur>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-pear
epoch=1
pkgver=1.10.17
pkgrel=1
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='https://pear.php.net/'
depends=('php')
license=('PHP')
source=("install-pear-nozlib-${pkgver}.phar::https://github.com/pear/pearweb_phars/raw/v${pkgver}/install-pear-nozlib.phar"
        "install-pear-nozlib-${pkgver}.phar.sig::https://github.com/pear/pearweb_phars/raw/v${pkgver}/install-pear-nozlib.sig")
backup=('etc/php/pear.conf')
sha256sums=('3dcf9f3b76fc02c3b11f672ceddbdfeadd64625c7fcdc8ccd44215c976c16ce4'
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
