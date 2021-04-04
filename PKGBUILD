# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=falltergeist-git
pkgver=0.3.1.r169.g39a6cee8
pkgrel=1
pkgdesc='Opensource Fallout game engine written in C++ and SDL (git)'
arch=(x86_64)
url=https://falltergeist.org
license=(GPL3)
groups=()
depends=(sdl2 sdl2_image sdl2_mixer zlib glew glm)
makedepends=(cmake git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/falltergeist/falltergeist.git)
md5sums=('SKIP')

pkgver() {
	git -C "${pkgname%-git}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "${pkgname%-git}" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
