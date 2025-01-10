# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libsvg
pkgver=0.1.4
pkgrel=8

pkgdesc="A library for rendering SVG documents"
arch=('i686' 'x86_64')
url="https://cairographics.org/"
license=('LGPL-2.1-only')

depends=('glibc' 'libxml2')
options=(strip !libtool)

source=(https://cairographics.org/snapshots/$pkgname-$pkgver.tar.gz
	libpng14.patch)
b2sums=('c000eb3ddfce3ec134ae614676fe42b0ae5bc4206928c69ca846cf758a0862c29c0e1c2ebe346c6b60781d4f35c5840ee0c18344da5e2e57e3f9b60b6bb9c5dd'
	'f0f98d0ddd2b43ee798c8f0616aa877d2512cfef0e82609e09f118f1fac7553569184760ab42069b46d9fecbf99836642004e1436f9024d0dc816b5353e40c56')

build() {
	CFLAGS+=" -Wno-error=implicit-function-declaration -Wno-error=int-conversion"
	CXXFLAGS+="${_CFLAGS}"
	export CFLAGS CXXFLAGS

	cd $pkgname-$pkgver
	./configure --prefix=/usr
	patch -p1 <"$srcdir"/libpng14.patch
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
