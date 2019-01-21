# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-pear
epoch=1
pkgver=1.10.9
pkgrel=2
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='https://pear.php.net/'
depends=('php')
license=('PHP')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pear/pearweb_phars/archive/v${pkgver}.tar.gz")
backup=('etc/php/pear.conf')
sha256sums=('011a8c721f00fed7ce0dad734ac91e1f80e4b4bba110b0bb92f0553c5ed54bdd')

package() {
	PHP_PEAR_SYSCONF_DIR=/etc/php \
	INSTALL_ROOT=$pkgdir \
		php -n ${srcdir}/pearweb_phars-${pkgver}/install-pear-nozlib.phar \
			-d /usr/share/pear \
			-b /usr/bin

	rm -rf ${pkgdir}{/usr/share/pear/,/}.{channels,depdb,depdblock,filemap,lock,registry}
}
