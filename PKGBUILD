# Maintainer: Máté Szabó <mszabo-oss at protonmail dot com>
pkgname=todds
pkgver=0.4.1
pkgrel=2
pkgdesc="A CPU-based DDS encoder optimized for fast batch conversions with high encoding quality."
arch=('x86_64')
url="https://github.com/todds-encoder/todds"
license=('MPL2')
depends=('glibc' 'gcc-libs' 'boost-libs' 'onetbb' 'opencv' 'hyperscan' 'fmt')
makedepends=('cmake' 'boost' 'ispc')
checkdepends=('catch2>=3.4.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/todds-encoder/todds/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('483ae1b8b1c5bf62b53ffb933fb15048d328a55b7ac6b1562d809c6fb48629837b6eb2c738518bd9983b8769152c23ca7723dbcb48f2d38f524305b1e78948e7')

build() {
	cd "$pkgname-$pkgver"

	cmake -B build -DCMAKE_MAKE_PROGRAM=make -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX -DTODDS_UNIT_TESTS=1 -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

check() {
	cd "$pkgname-$pkgver"
	./build/test/todds_test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --build build --target install
}
