# Maintainer: ROllerozxa <rollerozxa@voxelmanip.se>
pkgname=principia-git
pkgver=r668.cc6e7f64
pkgrel=1
pkgdesc="Physics-based sandbox building game."
url='https://github.com/Bithack/principia/'
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('gtk3' 'curl' 'libpng' 'libjpeg-turbo' 'freetype2' 'sdl3' 'xdg-utils')
makedepends=('clang' 'git' 'cmake' 'ninja')
provides=("principia")
conflicts=("principia")
source=('git+https://github.com/Bithack/principia')
sha256sums=('SKIP')
options=(!lto)

pkgver() {
	cd principia
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd principia/

	mkdir -p build
	cd build
	# Upstream recommends building with Clang
	cmake .. -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
	ninja
}

package() {
	cd principia/build/
	DESTDIR="${pkgdir}" ninja install
}
