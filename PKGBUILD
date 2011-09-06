# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.0.10
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)

if [[ $CARCH == "x86_64" ]]; then
	source=(http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	md5sums=('d269a1214606fda6c921af5af5f2aa9d')
else
	source=(http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	md5sums=('80fad9596d3638dc401a5682b95ffb08')
fi

build() {
	cd "$srcdir/ioncube"

	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 ioncube_loader_lin_5.3.so "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
	install -D -m0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
