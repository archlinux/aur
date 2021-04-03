arch=(any)
backup=("etc/shiromino.ini")
conflicts=(shiromino)
depends=(
	libvorbis
	sdl2
	sdl2_image
	sdl2_mixer
	sqlite
)
license=(MIT)
makedepends=(
	cmake
	git
	pkgconf
)
pkgdesc="A fast-paced puzzle game with roots in the arcade"
pkgname=shiromino-git
pkgrel=1
pkgver=v0.1.0+12+g3fdd58a
provides=(shiromino)
sha256sums=(SKIP)
source=(git+https://github.com/shiromino/shiromino.git)
url=https://github.com/shiromino/shiromino
pkgver() {
	git -C "$srcdir/shiromino" describe --tags | tr - +
}
build() {
	cd "$srcdir/shiromino"
	cmake\
		-B build\
		-DCMAKE_BUILD_TYPE=Release\
		-DENABLE_OPENGL_INTERPOLATION=1\
		-S .
	cmake --build build
}
package() {
	cmake --install "$srcdir/shiromino/build" --prefix "$pkgdir" --strip
}