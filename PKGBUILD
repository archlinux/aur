# Maintainer: kinker31<dp223171@gmail.com>
_namey=lab3d-sdl
pkgname=lab3d-sdl-git
pkgver=r217.295e95a
pkgrel=1
pkgdesc="Enhanced port of Ken's Labyrinth with hi-res texture support (git version)"
arch=('x86_64')
url="https://github.com/sacredbanana/lab3d-sdl"
license=('GPL')
depends=('sdl2' 'zlib' 'sdl2_image' 'glu' 'glibc')
makedepends=('cmake>=3.26')
conflicts=(lab3d-sdl)
source=("git+https://github.com/sacredbanana/lab3d-sdl")
sha256sums=('SKIP')
pkgver() {
	cd "$_namey"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$_namey"
	cmake -B build -S . \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-Wno-dev
	cmake --build build
}

package() {
	cd "$_namey"
	DESTDIR="$pkgdir" cmake --install build
}
