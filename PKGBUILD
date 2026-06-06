# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=principia
pkgver=2026.06.06
pkgrel=1
pkgdesc="Physics-based sandbox building game."
url='https://github.com/Bithack/principia/'
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('gtk3' 'curl' 'libpng' 'libjpeg' 'freetype2' 'sdl2')
makedepends=('clang' 'cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bithack/principia/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('81110ca1c75e97a33c48c73b50853dd770b874d75ece85b4603bb96f77f48ac5')
options=(!lto)

build() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build
	cd build
	# Upstream recommends building with Clang
	cmake .. -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
	ninja
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
