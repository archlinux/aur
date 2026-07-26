# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: nm10923 https://nm10923.xyz/contact
# Contributor: Erik Kallen <info@erikkallen.nl>

pkgname=sdl3_image-git
pkgver=r2046.0ee698e
pkgrel=1
pkgdesc="SDL3 image loading library"
arch=(
	"aarch64"
	"x86_64"
)
url="https://github.com/libsdl-org/SDL_image"
license=("Zlib")
depends=(
	"glibc"
	"sdl3"
	"libpng"
	"libtiff"
	"libjpeg-turbo"
	"libwebp"
	"libavif"
	"libjxl"
)
makedepends=(
	"cmake"
	"git"
)
source=("git+https://github.com/libsdl-org/SDL_image")
sha256sums=("SKIP")
provides=("sdl3_image")
conflicts=("sdl3_image")

pkgver() {
	cd "${srcdir}/SDL_image"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cmake \
		-B build \
		-S "SDL_image" \
		-D SDLIMAGE_SAMPLES=OFF \
		-D SDLIMAGE_TESTS=OFF \
		-D CMAKE_BUILD_TYPE=None \
		-D CMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "SDL_image/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
