#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact AT amb DOT tf>
pkgname=php-libsodium
pkgver=1.0.6
pkgrel=1
pkgdesc="Simple, low-level PHP extension for libsodium"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium-php"
license=('BSD')
depends=('php>=5.4.0' 'php<7.2' 'libsodium')
backup=('etc/php/conf.d/libsodium.ini')
source=("https://github.com/jedisct1/libsodium-php/archive/$pkgver.tar.gz")
md5sums=('30584a13fda5d4767cffb52c641ffc9b')

build() {
	cd "libsodium-php-$pkgver"
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "libsodium-php-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 <(echo \;extension=libsodium.so) "$pkgdir/etc/php/conf.d/libsodium.ini"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
