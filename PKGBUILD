# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=kvazaar
pkgver=0.8.2
pkgrel=1
pkgdesc="An open-source HEVC encoder licensed under LGPLv2.1"
arch=('i686' 'x86_64')
url="http://ultravideo.cs.tut.fi/#encoder"
license=('LGPL2.1')
depends=('glibc')
makedepends=('yasm')
provides=('kvazaar' 'libkvazaar.so')
conflicts=('kvazaar-git')
source=("$pkgname"-"$pkgver".tar.gz::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz")
sha256sums=('1b9354a639ab6c902e974780b39112b5e75477205611f88b54562c895182b945')

prepare() {
	cd "$pkgname"-"$pkgver"
	./autogen.sh
}

build() {
	cd "$pkgname"-"$pkgver"
	./configure \
                --prefix=/usr \
                --enable-static=no \
                --enable-shared=yes \
                --enable-fast-install=yes
}

package() {
	cd "$pkgname"-"$pkgver"
	make DESTDIR="$pkgdir/" install
}
