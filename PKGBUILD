# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=principia
pkgver=2026.07.15
pkgrel=1
pkgdesc="Physics-based sandbox building game."
url='https://github.com/Bithack/principia/'
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('gtk3' 'curl' 'libpng' 'libjpeg-turbo' 'freetype2' 'sdl3' 'xdg-utils')
makedepends=('clang' 'cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bithack/principia/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2b8009f36bda3c806c28760845aa75ec7307220ab47231a051f28b53f98d6364')
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
