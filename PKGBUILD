# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

pkgname=php-msgpack
_extname=msgpack
pkgver=2.2.0
pkgrel=2
pkgdesc="PHP extension for interfacing with MessagePack"
arch=("i686" "x86_64")
license=('New BSD')
url="http://msgpack.org/"
depends=('php')
backup=("etc/php/conf.d/$_extname.ini")
source=("https://pecl.php.net/get/$_extname-${pkgver}RC1.tgz")
sha512sums=('4ddb9b6e9f4d9255d49c10e03a9ad4b37cf869f30b5e3c333518314bdbdfa8d4d20996a24954da19cba6352e76e02488b813fe6aa107c8fe390d6ca85d625096')

build() {
	cd "$srcdir/$_extname-${pkgver}RC1"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-${pkgver}RC1"

	make install INSTALL_ROOT="${pkgdir}"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
