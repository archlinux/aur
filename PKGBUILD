# Maintainer: Timo Sarawinski <timo@it-kraut.net> 

pkgname=php73-pear
epoch=1
pkgver=1.10.17
pkgrel=1
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='https://pear.php.net/'
depends=('php73')
license=('PHP')
source=("install-pear-nozlib-${pkgver}.phar::https://github.com/pear/pearweb_phars/raw/v${pkgver}/install-pear-nozlib.phar"
        "install-pear-nozlib-${pkgver}.phar.sig::https://github.com/pear/pearweb_phars/raw/v${pkgver}/install-pear-nozlib.sig")
backup=('etc/php73/pear.conf')
sha256sums=('3dcf9f3b76fc02c3b11f672ceddbdfeadd64625c7fcdc8ccd44215c976c16ce4'
            'SKIP')
validpgpkeys=('10F68CF73F8AA426F617752972A321BAC245F175')

package() {
	PHP_PEAR_TEMP_DIR=/tmp/pear73 PHP_PEAR_CACHE_DIR=/tmp/pear73 PHP_PEAR_PHP_BIN=/usr/bin/php73 PHP_PEAR_SYSCONF_DIR=/etc/php73 \
	INSTALL_ROOT=$pkgdir \
		php73 -n install-pear-nozlib-${pkgver}.phar \
			-d /usr/share/pear73 \
			-b /usr/bin
	mv $pkgdir/usr/bin/pear $pkgdir/usr/bin/pear73
	mv $pkgdir/usr/bin/peardev $pkgdir/usr/bin/peardev73
        mv $pkgdir/usr/bin/pecl $pkgdir/usr/bin/pecl73

	rm -rf ${pkgdir}{/usr/share/pear73/,/}.{channels,depdb,depdblock,filemap,lock,registry}
}
