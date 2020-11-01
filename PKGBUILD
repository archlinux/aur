# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou
pkgver=3.50
pkgrel=1
pkgdesc="A tool to create images from sound"
arch=(x86_64)
url="https://biniou.net/"
license=('GPL')
depends=(libmagick6 fftw sdl2_ttf libcaca ffmpeg lebiniou-data)
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('2104c356c97f0648ab4e2543ef71a2bd78f37af6ee06e2a5357b6b4e0d638d56')

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

