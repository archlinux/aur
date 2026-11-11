# Maintainer: Inc44
pkgname=libbsc
pkgver=3.4.0
pkgrel=1
pkgdesc="High-performance block-sorting data compressor"
arch=(
	aarch64
	x86_64
)
url=https://github.com/IlyaGrebnov/libbsc
license=(Apache-2.0)
depends=(
	gcc-libs
	glibc
)
makedepends=(
	cmake
	git
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=(d2595f2bb2f34b46fd11407e8010910da201e7a5c59083575a3e911db7fd59a6)

build() {
	cd "$srcdir/libbsc"
	cmake -S . -B build \
		-DCMAKE_C_COMPILER=gcc \
		-DCMAKE_CXX_COMPILER=g++ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBSC_ENABLE_CUDA=OFF
	cmake --build build
}

package() {
	cd "$srcdir/libbsc"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
