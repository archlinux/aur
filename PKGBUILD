# Maintainer: DownerCase <downercase8 (at) gmail (dot) com>

pkgname=recycle
pkgver=7.0.0
pkgrel=1
pkgdesc="Simple resource pool for recycling resources in C++"
arch=('any')
url="https://github.com/steinwurf/recycle"
license=('BSD-3-Clause')
makedepends=(
	cmake
	git
)
source=("git+https://github.com/steinwurf/recycle.git#tag=$pkgver")
sha256sums=('f8f9b8d10c9900594e94b0236aea317f9163e3f9608f67e8b38d6890fee153d8')

build() {
	local cmake_options=(
		-S "$pkgname"
		-B build
		-DCMAKE_INSTALL_PREFIX=/usr
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	install -Dm644 "$pkgname/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	DESTDIR="$pkgdir" cmake --install build
}
