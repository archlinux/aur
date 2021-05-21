# Maintainer: Michael von Domaros <mvondomaros at gmail dot com>

pkgname=travis
pkgver=210521
pkgrel=1
pkgdesc="Trajectory Analyzer and Visualizer"
arch=('i686' 'x86_64')
url="http://www.travis-analyzer.de"
license=('GPL3')
depends=('gcc-libs')
options=('!strip')
source=($url/files/$pkgname-src-$pkgver.tar.gz)
md5sums=('b94edc9f268cb824800c86594e39826c')

_cdsrcdir() {
	cd "$srcdir/$pkgname-src-$pkgver"
}

prepare() {
	_cdsrcdir
	# Delete Makefile CFLAGS. We will set them as environment variable below.
	sed -i '/CFLAGS \+=/d' Makefile
}

build() {
	_cdsrcdir
	# Set CFLAGS.
	export CFLAGS="$CFLAGS -g -ansi -std=c++14 -fsigned-char -pthread -O3 -march=native"
	make
}

package() {
	_cdsrcdir
	install -Dm 755 exe/travis $pkgdir/usr/bin/travis
}
