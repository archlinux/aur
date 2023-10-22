# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=tpie-git
pkgver=r5115.82a6e880
pkgrel=1
pkgdesc='The Templated Portable I/O Environment'
arch=('x86_64')
url='https://github.com/thomasmoelhave/tpie'
license=('GPL')
makedepends=('cmake' 'boost' 'snappy' 'lz4' 'zstd' 'git')
source=('git+https://github.com/thomasmoelhave/tpie')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/tpie"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S tpie \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cp build/tpie/tpie_export.h "$pkgdir/usr/include/tpie/"
}
