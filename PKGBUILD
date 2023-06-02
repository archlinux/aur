# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

pkgname=php-msgpack
_extname=msgpack
pkgver=2.2.0
pkgrel=4
pkgdesc="PHP extension for interfacing with MessagePack"
arch=("i686" "x86_64")
license=('New BSD')
url="http://msgpack.org/"
depends=('php')
backup=("etc/php/conf.d/$_extname.ini")
source=("https://pecl.php.net/get/$_extname-${pkgver}.tgz")
sha512sums=('91cb45e79b78624938ddabce39327a093d668a875fad6e2ce55058e54a742a3a35ea58069446399425816613ebdf5fc503222555b9296a22879d2b7eb475b8c9')

build() {
	cd "$srcdir/$_extname-${pkgver}"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-${pkgver}"

	make install INSTALL_ROOT="${pkgdir}"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
