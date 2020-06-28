# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

pkgname=php-rdkafka
_extname=rdkafka
pkgver=4.0.3
pkgrel=1
pkgdesc="PHP-rdkafka is a thin librdkafka binding providing a working PHP 5 / PHP 7 Kafka client"
arch=("i686" "x86_64")
url="https://github.com/arnaud-lb/php-rdkafka"
license=('MIT')
depends=('php' 'librdkafka')
source=("https://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
md5sums=('766efc78dd01a4a65c8200e4abee957d')

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
