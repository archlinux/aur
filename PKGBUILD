# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou
pkgver=3.51
pkgrel=1
pkgdesc="A tool to create images from sound"
arch=(x86_64)
url="https://biniou.net/"
license=('GPL')
depends=(libmagick6 fftw sdl2_ttf libcaca ffmpeg lebiniou-data libulfius)
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('567dfe611d89874e7a5c53f9f6f8584531ca062590fa231271d78d8895d64cc3')

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

