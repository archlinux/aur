# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=z80e
pkgver=0.5.0
pkgrel=1
license=('MIT')
pkgdesc='An emulation library and client programs for z80 calculators'
depends=("sdl" "scas")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/z80e'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/z80e/archive/$pkgver.tar.gz")
md5sums=('cec89fd0b0eecc63b616eabbe973ac4f')

build() {
	cd "${pkgname}-${pkgver}"
	echo "TARGET_LINK_LIBRARIES(z80e-sdl SDL2)" >> frontends/sdl/CMakeLists.txt
	cmake -Denable-sdl=YES -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" make install
}
