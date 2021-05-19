# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

pkgname=php-msgpack
_extname=msgpack
pkgver=2.1.2
pkgrel=1
pkgdesc="PHP extension for interfacing with MessagePack"
arch=("i686" "x86_64")
license=('New BSD')
url="http://msgpack.org/"
depends=('php')
backup=("etc/php/conf.d/$_extname.ini")
source=("https://pecl.php.net/get/$_extname-$pkgver.tgz")
sha512sums=('adce1ab7e6dba603398a2caa1f318c85748d9f991d8f56aaf7b93417c65146ca77916241549e76ef3bdfece0cf893990221e77c251e6369403740b02ae6bcff7')

build() {
	cd "$srcdir/$_extname-$pkgver"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"

	make install INSTALL_ROOT="${pkgdir}"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
