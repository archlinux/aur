# Maintainer: Michael von Domaros <mvondomaros at gmail dot com>

pkgname=travis
pkgver=200504
pkgrel=2
pkgdesc="Trajectory Analyzer and Visualizer"
arch=('i686' 'x86_64')
url="http://www.travis-analyzer.de"
license=('GPL3')
depends=('gcc-libs')
options=('!strip')
source=($url/files/$pkgname-src-$pkgver-hf2.tar.gz)
md5sums=('c724e4170080db8f6e1cf5c0bc8d5013')

_cdsrcdir() {
	cd "$srcdir/$pkgname-src-$pkgver-hf2"
}

prepare() {
	_cdsrcdir
	sed -i '/CFLAGS \+=/d' Makefile
}

build() {
	_cdsrcdir
	export CFLAGS="$CFLAGS -g -ansi -O3 -march=native"
	make
}

package() {
	_cdsrcdir
	install -Dm 755 exe/travis $pkgdir/usr/bin/travis
}
