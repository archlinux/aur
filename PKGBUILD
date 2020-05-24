# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou
pkgver=3.42.1
pkgrel=1
pkgdesc="A tool to create images from sound"
arch=(x86_64)
url="https://biniou.net/"
license=('GPL')
depends=(libmagick6 fftw sdl2_ttf libcaca ffmpeg lebiniou-data)
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('8398bf56ee3973472772f06ce51bcf551c617d9c959bfda8147f09863da452f5')

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

