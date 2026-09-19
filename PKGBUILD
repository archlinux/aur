# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=principia
pkgver=2026.09.19
pkgrel=1
pkgdesc="Physics-based sandbox building game."
url='https://github.com/Bithack/principia/'
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('curl' 'libpng' 'libjpeg-turbo' 'freetype2' 'sdl3' 'xdg-utils')
makedepends=('clang' 'cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bithack/principia/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('56323d54c49c2d679558e68b1cf683643616476f49ace8fa55540b95ea032d34')
options=(!lto)

build() {
	cd "${pkgname}-${pkgver}"

	mkdir -p build
	cd build
	# Upstream recommends building with Clang
	cmake .. \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_C_COMPILER=/usr/bin/clang \
		-DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-G Ninja
	ninja
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
