# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=kvazaar
pkgver=1.0.0
pkgrel=2
pkgdesc="An open-source HEVC encoder licensed under LGPLv2.1"
arch=('i686' 'x86_64')
url="http://ultravideo.cs.tut.fi/#encoder"
license=('LGPL2.1')
depends=('glibc')
makedepends=('yasm')
provides=('kvazaar' 'libkvazaar.so')
conflicts=('kvazaar-git')
source=("$pkgname"-"$pkgver".tar.gz::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz")
sha256sums=('40eb7b4b23897299e99050f0c011e9380cf898b25615dd143f018b278b972a46')

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
