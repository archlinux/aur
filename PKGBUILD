# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=simdjson
pkgver=2.0.4
pkgrel=1
pkgdesc="A C++ library to see how fast we can parse JSON with complete validation."
arch=('x86_64')
url="https://github.com/simdjson/simdjson"
license=('APACHE')
depends=(gcc-libs)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/simdjson/simdjson/archive/v$pkgver.tar.gz")
sha256sums=('c8a12cf60f6ce8c0e556f68bd80e7bd9f11f5876e198ed3637da8ccf182eaa24')

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
