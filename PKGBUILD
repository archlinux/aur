# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Experimental, scalable, high performance HTTP server'
pkgname=lwan
pkgver=0.4
pkgrel=1
arch=(x86_64)
license=(GPL)
url=https://lwan.ws
depends=(brotli zstd jemalloc)
makedepends=(cmake ninja clang)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lpereira/lwan/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d2382bd51214df88e6a28e344435ed4f4d1e0225a6beec9315c8e9fa001d0b5aee2f6b38e27169a375dd2d9873bb0fa03d0430445d88d42846505e0690e1e986')

build () {
	rm -rf build

	cmake -S"${pkgname}-${pkgver}" -Bbuild -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DUSE_ALTERNATIVE_MALLOC=jemalloc

	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --install build
}
