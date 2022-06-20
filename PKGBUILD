# Maintainer: Aaron Barany <akb825@gmail.com>

pkgname=('cuttlefish-tool')
pkgver=2.5.6
pkgrel=1
pkgdesc='Texture converter tool and library'
arch=('i686' 'x86_64')
url="https://github.com/akb825/Cuttlefish"
license=('Apache')
makedepends=('cmake' 'git' 'ispc')
depends=('freeimage')
source=()
sha256sums=()

build() {
	mkdir Cuttlefish && cd Cuttlefish
	git clone https://github.com/akb825/Cuttlefish.git .
	git checkout v${pkgver}
	git submodule update --init
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
		-DCUTTLEFISH_BUILD_DOCS=OFF -DCUTTLEFISH_BUILD_TESTS=OFF -DCUTTLEFISH_SHARED=ON
	make
}

package() {
	cd Cuttlefish/build
	make DESTDIR="${pkgdir}" install
}
