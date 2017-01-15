# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-ev
_extname=ev
pkgver=1.0.4
pkgrel=1
pkgdesc="PHP extension for interfacing with MessagePack"
arch=("i686" "x86_64")
url="https://bitbucket.org/osmanov/pecl-ev"
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

sha256sums=('13804cb70e39a0abc014b45230a990ff046d748a9d806feca9ac511516be4f61')
