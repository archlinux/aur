# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-xdebug
_extname=xdebug
pkgver=2.6.0
pkgrel=1
pkgdesc="Xdebug is an extension for PHP to assist with debugging and development."
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=('php>=7')
makedepends=()
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
	echo ";zend_extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

sha256sums=('b5264cc03bf68fcbb04b97229f96dca505d7b87ec2fb3bd4249896783d29cbdc')
