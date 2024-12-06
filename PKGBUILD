# Maintainer: ROllerozxa <rollerozxa@voxelmanip.se>
pkgname=principia-git
pkgver=r399.7085fbab
pkgrel=1
pkgdesc="Physics-based sandbox building game."
url='https://github.com/Bithack/principia/'
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('gtk3' 'glew' 'curl' 'libpng' 'libjpeg' 'freetype2' 'sdl2')
makedepends=('git' 'cmake' 'ninja')
provides=("principia")
conflicts=("principia")
source=('git+https://github.com/Bithack/principia')
sha256sums=(SKIP)
options=(!lto)

pkgver() {
	cd principia
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd principia/

	mkdir -p build
	cd build
	cmake .. -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
	ninja
}

package() {
	cd principia/build/
	DESTDIR="${pkgdir}" ninja install
}
