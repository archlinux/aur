# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=robin-map
pkgname=mingw-w64-${_pkgname}
pkgver=1.4.0
pkgrel=1
pkgdesc='C++ implementation of a fast hash map and hash set using robin hood hashing (mingw-w64)'
url='https://github.com/Tessil/robin-map'
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
arch=('any')
options=(!strip !buildflags staticlibs)
conflicts=('mingw-w64-robinmap')
replaces=('mingw-w64-robinmap')
sha256sums=('7930dbf9634acfc02686d87f615c0f4f33135948130b8922331c16d90a03250c')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Tessil/robin-map/archive/v${pkgver}.tar.gz")

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
	done
}
