#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=php-libsodium
pkgver=2.0.7
pkgrel=1
pkgdesc="Simple, low-level PHP extension for libsodium"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium-php"
license=('BSD')
depends=('php>=7.0' 'php<7.2' 'libsodium>=1.0.9')
backup=('etc/php/conf.d/libsodium.ini')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jedisct1/libsodium-php/archive/$pkgver.tar.gz")
md5sums=('c5112f26d82ec0b7d5e7500dfca3d844')

build() {
	cd "libsodium-php-$pkgver"
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "libsodium-php-$pkgver"
	# shellcheck disable=SC2154
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 <(echo \;extension=sodium.so) "$pkgdir/etc/php/conf.d/libsodium.ini"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
