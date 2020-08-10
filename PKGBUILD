# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou
pkgver=3.43
pkgrel=1
pkgdesc="A tool to create images from sound"
arch=(x86_64)
url="https://biniou.net/"
license=('GPL')
depends=(libmagick6 fftw sdl2_ttf libcaca ffmpeg lebiniou-data)
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('5da807992bcde951f827cf60848989bd687425ec638f67bb211609260c0b3074')

build() {
	cd "$pkgname-version-$pkgver"

	autoreconf --install
	export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}

