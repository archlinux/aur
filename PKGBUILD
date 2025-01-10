# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libsvg-cairo
pkgver=0.1.6
pkgrel=13

pkgdesc="A library for rendering SVG documents"
arch=('i686' 'x86_64')
url="https://cairographics.org/"
license=('LGPL-2.1-only')

depends=('cairo>=1.4.6'
	'glibc'
	'libjpeg'
	'libsvg'
	'libxml2'
	'libpng'
	'zlib')

makedepends=('libpng')
options=(strip !libtool)

source=(https://cairographics.org/snapshots/$pkgname-$pkgver.tar.gz)
b2sums=('c890f6b613c15c72d0bc4c64548ed3ee5066e6d32eb1316ec23b68a8a315265cc8351434c9492f83582e858212bacbb951093342002e44dc05724fae5968bfeb')

build() {
	CFLAGS+=" -Wno-error=implicit-function-declaration -Wno-error=int-conversion"
	CXXFLAGS+="${_CFLAGS}"
	export CFLAGS CXXFLAGS

	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --disable-static
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
