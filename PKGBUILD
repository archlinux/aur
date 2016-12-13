# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-yar
_extname=yar
pkgver=2.0.1
pkgrel=1
pkgdesc="Light, concurrent RPC framework"
arch=("i686" "x86_64")
url="https://github.com/laruence/yar"
license=('PHP')
depends=('php' 'libzookeeper')
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

sha256sums=('f3b5617087afa1deffba8f0cdcbbd587589ff6c58af8da1c98437837f01114a4')
