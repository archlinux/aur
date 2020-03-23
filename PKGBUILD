pkgbase=vfc
pkgname=('vfc')
pkgver=1.1.1
pkgrel=1
pkgdesc='Library and tool for converting vertex formats for use in real-time rendering.'
arch=('i686' 'x86_64')
url="https://github.com/akb825/VertexFormatConvert"
license=('Apache')
makedepends=('cmake' 'git')
source=()
sha256sums=()

build() {
	mkdir VFC && cd VFC
	git clone https://github.com/akb825/VertexformatConvert .
	git checkout v${pkgver}
	git submodule init
	git submodule update
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_SKIP_RPATH=TRUE -DVFC_BUILD_DOCS=OFF -DVFC_BUILD_TESTS=OFF -DVFC_SHARED=ON
	make
}

package() {
	cd VFC/build
	make DESTDIR="${pkgdir}" install
}
