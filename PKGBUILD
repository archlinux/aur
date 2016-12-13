# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-rdkafka
_extname=rdkafka
pkgver=2.0.1
pkgrel=1
pkgdesc="This extension is a librdkafka binding providing a working client for Kafka 0.8, 0.9, 0.10"
arch=("i686" "x86_64")
url="https://github.com/arnaud-lb/php-rdkafka"
license=('MIT License')
depends=('php' 'librdkafka-git')
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

sha256sums=('43a3704198f7d8ae23f6ed06d2d28ae4d52bae0f93f484aa5d61d5d60f809eee')
