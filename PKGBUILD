# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

pkgname=php-msgpack
_extname=msgpack
pkgver=2.2.0
pkgrel=3
pkgdesc="PHP extension for interfacing with MessagePack"
arch=("i686" "x86_64")
license=('New BSD')
url="http://msgpack.org/"
depends=('php')
backup=("etc/php/conf.d/$_extname.ini")
source=("https://pecl.php.net/get/$_extname-${pkgver}RC2.tgz")
sha512sums=('11b7243e6abb7dc58a02e2289433a292e2b2a3298357e3a14468faa06c7d302c442891cdf944e31b22435b9ce449b2ab632e30c1c5ccdec8f6b6e5033a2cdbef')

build() {
	cd "$srcdir/$_extname-${pkgver}RC2"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-${pkgver}RC2"

	make install INSTALL_ROOT="${pkgdir}"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
