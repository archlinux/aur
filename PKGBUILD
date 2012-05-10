# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.1
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=($pkgname-$pkgver-$CARCH.tgz::http://www.ioncube.com/early_access/phpd-4.1-libs-linux_x86_64-glibc2.3.4.tgz)
	md5sums=('1dfdb4b23332ed6cd3816ac9df525ffb')
else
	source=($pkgname-$pkgver-$CARCH.tgz::http://www.ioncube.com/early_access/phpd-4.1-libs-linux_i686-glibc2.3.4.tgz)
	md5sums=('b4090f890faef626a4f69925ced0ca92')
fi

build() {
	cd "$srcdir"

	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 linux_$CARCH-glibc2.3.4/5.4.0/ioncube_loader_lin_5.4.so "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
# 	install -D -m0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
