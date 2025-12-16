# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=clipper2
pkgver=1.5.4
pkgrel=2
pkgdesc='Polygon Clipping and Offsetting'
arch=(x86_64)
url="https://github.com/AngusJohnson/${pkgname^}"
license=(BSL-1.0)
depends=(glibc
         gcc-libs)
makedepends=(cmake)
provides=(libClipper2Z.so
          libClipper2.so)
conflicts=(manifold)
_tag="${pkgname^}_$pkgver"
_archive="${pkgname^}-$_tag"
source=("$url/archive/refs/tags/$_tag/$_archive.tar.gz")
sha256sums=('9d8a35a29d04cd1b7b45f542c0ba48015feece1210036ea9e4efaad3140af4b0')

build () {
	cd "$_archive/CPP"
	local cmake_options=(
		-D CMAKE_INSTALL_PREFIX=/usr
		-D BUILD_SHARED_LIBS=On
		-D CLIPPER2_TESTS=Off
		-D CLIPPER2_EXAMPLES=Off
		-D CLIPPER2_UTILS=Off
	)
	cmake -B build -W no-dev "${cmake_options[@]}"
	cmake --build build
}

package () {
	cd "$_archive/CPP"
	DESTDIR="$pkgdir" cmake --install build
}
