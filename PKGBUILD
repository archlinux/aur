# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.4.3
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=($pkgname-$CARCH-$pkgver.tar.bz2::http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	sha256sums=('ad3d292255b85426e7dfecee360a29cbb119746bd7b34a6b96be0d9ca830dad6')
else
	source=($pkgname-$CARCH-$pkgver.tar.bz2::http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	sha256sums=('dd64e19a249599af4ec01074aaed755fed9f3e7eae2d3cdfa796a74004d856e7')
fi

package() {
	cd "$srcdir"
	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 ioncube/ioncube_loader_lin_5.4.so "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
# 	install -D -m0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
