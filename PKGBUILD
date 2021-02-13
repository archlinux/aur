# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-robin-map
pkgver=0.6.3
pkgrel=2
pkgdesc="A C++ implementation of a fast hash map and hash set using robin hood hashing (mingw-w64)"
url="https://github.com/Tessil/robin-map"
license=("MIT")
depends=(
	"mingw-w64-crt"
)
makedepends=("mingw-w64-cmake")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
conflicts=('mingw-w64-robinmap')
replaces=('mingw-w64-robinmap')
sha256sums=(
	"e6654c8c2598f63eb0b1d52ff8bdf39cfcc91d81dd5d05274a6dca91241cd72f"
)
source=(
	"https://github.com/Tessil/robin-map/archive/v${pkgver}.tar.gz"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "robin-map-${pkgver}" -B "build-${_arch}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
	done
}
