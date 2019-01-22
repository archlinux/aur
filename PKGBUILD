# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-pear
epoch=1
pkgver=1.10.10
pkgrel=1
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='https://pear.php.net/'
depends=('php')
license=('PHP')
source=("https://github.com/pear/pearweb_phars/raw/v${pkgver}/install-pear-nozlib.phar"
        "install-pear-nozlib.phar.sig::https://github.com/pear/pearweb_phars/raw/v${pkgver}/install-pear-nozlib.sig")
backup=('etc/php/pear.conf')
sha256sums=('96eb42707944630552a76865aec8645c0fd4c32698ad34f1b29946affeed1485'
            'SKIP')
validpgpkeys=('10F68CF73F8AA426F617752972A321BAC245F175')

package() {
	PHP_PEAR_SYSCONF_DIR=/etc/php \
	INSTALL_ROOT=$pkgdir \
		php -n install-pear-nozlib.phar \
			-d /usr/share/pear \
			-b /usr/bin

	rm -rf ${pkgdir}{/usr/share/pear/,/}.{channels,depdb,depdblock,filemap,lock,registry}
}
