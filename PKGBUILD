# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=simdjson
epoch=1
pkgver=3.9.4
pkgrel=1
pkgdesc="A C++ library to see how fast we can parse JSON with complete validation."
arch=('x86_64')
url="https://github.com/simdjson/simdjson"
license=('Apache-2.0')
depends=(gcc-libs)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/simdjson/simdjson/archive/v$pkgver.tar.gz")
sha256sums=('9bf13be00fa1e1c5891a90dbc39b983e09972f0972a8956c20a9974cedfcca2f')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DBUILD_SHARED_LIBS='On' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	cmake --build build
}

# Running tests requires enabling developer mode, which greatly increases the
# required compilation, so we don't.
#
# Also tests refuse to compile with current GCC
# check() {
# 	cd "$pkgname-$pkgver"
# 	make test
# }

package() {
	DESTDIR="$pkgdir/" cmake --install build
}
