# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Experimental, scalable, high performance HTTP server'
pkgname=lwan
pkgver=0.5
pkgrel=1
arch=(x86_64)
license=(GPL-2.0-only)
url=https://lwan.ws
depends=(brotli zstd jemalloc)
makedepends=(cmake ninja clang)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lpereira/lwan/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('06b04e40c888d00886cf3f7e1df8158268b770af66a55a977e787ab9664f23b23d22b71a80052d551bb2f318e5a3e7c2cd0d7b962e497b8fbef16f0647dfe25b')

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
