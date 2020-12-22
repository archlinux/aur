# Contributor: sekret
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordgrinder
pkgver=0.8
pkgrel=1
pkgdesc="A word processor for processing words."
url="http://cowlark.com/wordgrinder/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=(ninja)
checkdepends=()
depends=('lua' 'lua52' 'lua52-filesystem' 'libx11' 'libxft' 'freetype2' 'zlib')
source=("https://github.com/davidgiven/$pkgname/archive/${pkgver}.tar.gz")
md5sums=('8a21e2ee18a9372741bb80b270588817')
sha1sums=('f45d1b8a52537adc086a743119bf77e8d8a47d30')
sha256sums=('856cbed2b4ccd5127f61c4997a30e642d414247970f69932f25b4b5a81b18d3f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i '7s!$(HOME)!'$pkgdir'/usr!' Makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
	cd licenses
	for i in COPYING.*; do
		install -Dm644 $i "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}
