# Maintainer: Sandor Nagy <sandor.nagy[at]kdemail[dot]net>
pkgname=rcssserver
pkgver=15.5.0
pkgrel=1
pkgdesc="The RoboCup Soccer Simulator Server"
arch=('x86_64' 'i686')
url="https://github.com/rcsoccersim/rcssserver"
license=('LGPL')
groups=('rcss')
depends=('boost-libs')
makedepends=('boost>=1.32' 'bison')
optdepends=(
	'rcssmonitor:	RCSS Monitor'
	'librcsc:	basic library to develop the RCSS client and tools')
replaces=('rcssbase')
options=('buildflags' 'makeflags')
source=(https://github.com/rcsoccersim/rcssserver/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('1dc1a82b3b6a920a12da08fa4f79fa90')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make -j1
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
