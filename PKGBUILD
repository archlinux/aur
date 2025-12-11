# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=kaitai-struct-cpp-stl-runtime
pkgver=0.11
pkgrel=1
pkgdesc='Kaitai Struct API for C++ using STL'
arch=(x86_64)
url="https://github.com/kaitai-io/${pkgname//-/_}"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cmake
             gtest)
_archive="${pkgname//-/_}-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('55f62b0d97e9f8df6db4e4577c6343d6ad95705a4ce6437bf25bf184c06840d2')

build() {
	cd "$_archive"
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake -W no-dev -B build "${cmake_options[@]}"
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
