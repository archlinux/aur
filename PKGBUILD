# Maintainer: shtrophic <christoph at liebender dot dev>

pkgname=vv
pkgver=1.0
pkgrel=1
license=(BSD-3-Clause)
url="https://github.com/wolfpld/vv"
pkgdesc="Terminal image viewer"
arch=(x86_64)
provides=(vv)
conflicts=(vv-bin) # same name, different program!
makedepends=(cmake)
depends=(
	openexr
	libheif
	libjpeg
	libjxl
	libpng
	libraw
	libsixel
	libtiff4
	libwebp
	zlib
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v1.0.tar.gz")
sha256sums=('c2c94e4d2fb02a9e14ebb3d1fbf2f31a4c6b1f923cbd44108311389c16e317d0')

build() {
	cmake -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev \
		"$srcdir/$pkgname-$pkgver"
	cmake --build build
}

package() {
	install -Dm 755 "$srcdir/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

