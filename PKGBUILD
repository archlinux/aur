# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Onur Kader <onurorkunkader1999@gmail.com>

pkgname=scnlib
pkgver=4.0.1
pkgrel=1
pkgdesc="A formatted input library, think {fmt} but in the other direction. 'scanf' for modern C++"
arch=("x86_64")
url="https://github.com/eliaskosunen/scnlib"
license=("Apache-2.0")
makedepends=(
	git
	cmake
	#doxygen
	# TODO not packaged
	#python-poxy
)
source=("git+https://github.com/eliaskosunen/scnlib.git#tag=v${pkgver}")
sha256sums=('6f0acc561a2759d6a8fab413964cfcc497ee1f2d2e2e32e3957e410cc13e86e2')

build() {
	cmake -B build -S "$pkgname" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DBUILD_SHARED_LIBS=ON \

	cmake --build build --target all #scn_docs
}

check() {
	cmake --build build --target test
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

