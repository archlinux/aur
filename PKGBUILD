# Maintainer: Máté Szabó <mszabo-oss at protonmail dot com>
pkgname=todds
pkgver=0.4.0
pkgrel=1
pkgdesc="A CPU-based DDS encoder optimized for fast batch conversions with high encoding quality."
arch=('x86_64')
url="https://github.com/joseasoler/todds"
license=('MPL2')
depends=('glibc' 'gcc-libs' 'boost-libs' 'onetbb' 'opencv' 'hyperscan' 'fmt')
makedepends=('cmake' 'boost' 'ispc')
checkdepends=('catch2v3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joseasoler/todds/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('bdde16a1960cf42798bca7119883d9cfe153f6c60fc799d2485a010efda169df734de68973738d080ef7a885c9c8cd0cf973697db7346c05b9729f6561faec52')

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
