# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=simdjson
epoch=1
pkgver=3.7.0
pkgrel=1
pkgdesc="A C++ library to see how fast we can parse JSON with complete validation."
arch=('x86_64')
url="https://github.com/simdjson/simdjson"
license=('APACHE')
depends=(gcc-libs)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/simdjson/simdjson/archive/v$pkgver.tar.gz")
sha256sums=('27315c4861893b3e036c1f672b1c238ee86be6edb84c0824d1ed20dea5999777')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX="/usr/" -DBUILD_SHARED_LIBS=On
	make
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
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
