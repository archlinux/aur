# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=principia
pkgver=2026.08.16
pkgrel=1
pkgdesc="Physics-based sandbox building game."
url='https://github.com/Bithack/principia/'
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('curl' 'libpng' 'libjpeg-turbo' 'freetype2' 'sdl3' 'xdg-utils')
makedepends=('clang' 'cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bithack/principia/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('044e7fb9c5fe6bfb57d6389224683874d49bb5ac058e96147cd0c3e0d9fd373c')
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
