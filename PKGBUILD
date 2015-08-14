# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-msgpack
_extname=msgpack
pkgver=0.5.6
pkgrel=1
pkgdesc="PHP extension for interfacing with MessagePack"
arch=("i686" "x86_64")
url="http://msgpack.org/"
license=('New BSD')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
packager="吕海涛 <aur@lvht.net>"

build() {
	cd "$srcdir/$_extname-$pkgver"
	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

sha256sums=('c118b942557dd1a0f0e6966457779d1d2fc4439a15f9b1d076b4e79a90f3b753')
