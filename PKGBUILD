# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=udis86
pkgver=1.7.2
pkgrel=2
pkgdesc="Minimalistic disassembler library"
arch=('x86_64')
url='https://github.com/vmt/udis86'
license=('BSD')
depends=('glibc')
makedepends=('python2')
provides=('libudis86.so=0-64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('43567f7e12168943c5b5ffb3d3f5b7a33cb36328f8938a993458f3ded0ba5779')

prepare() {
	cd "$pkgname-$pkgver"
	./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--with-python=/usr/bin/python2 \
		--enable-shared
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
