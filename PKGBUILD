# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dreamchess
pkgver=0.3.0
pkgrel=2
pkgdesc="DreamChess is an open source chess game. It comes with its own engine called Dreamer."
arch=(x86_64)
url="https://github.com/dreamchess/dreamchess"
license=(GPL3)
depends=(
	sdl2
	sdl2_image
	sdl2_mixer
	expat
	glew
)
makedepends=(
	flex
	bison
	cmake
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"$pkgname-music-1.0.tar.gz::$url-music/archive/refs/tags/1.0.tar.gz")
sha256sums=('b070a34acf69ed92e523902683d104abb295d78b6f37663f4668e929b9e90470'
            '2067e7415318edbc95f5aefab7ba1d196fb070809bf613e46492d8084ff18f9d')

build() {
	cd $pkgname-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr -B cmake
	make -C cmake
}

package() {
	cd $pkgname-$pkgver
	make -C cmake DESTDIR="$pkgdir" install
	# Install music content
	cp -av --no-preserve=ownership "$srcdir"/$pkgname-music-1.0/data/music "$pkgdir"/usr/share/$pkgname
}
