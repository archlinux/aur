# Maintainer: Stefan Auditor <stefan@auditor.email>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

pkgname=php-rdkafka
_extname=rdkafka
pkgver=6.0.1
pkgrel=1
pkgdesc="A thin librdkafka binding providing a working PHP 7 / PHP 8 Kafka client"
arch=("i686" "x86_64")
url="https://github.com/arnaud-lb/php-rdkafka"
license=('MIT')
depends=('php' 'librdkafka')
source=("https://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
md5sums=('dc6125dbfd9ff8adf0f1e428b3449184')

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
