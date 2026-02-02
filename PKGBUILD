# Maintainer: yiming564 <yiming564@proton.me>
pkgname=croaring
pkgver=4.5.1
pkgrel=1
epoch=
pkgdesc="Roaring bitmaps in C (and C++), with SIMD (AVX2, AVX-512 and NEON) optimizations: used by Apache Doris, ClickHouse, Alibaba Tair, Redpanda, YDB and StarRocks"
arch=('x86_64')
url="https://github.com/RoaringBitmap/CRoaring"
license=('Apache-2.0' 'MIT')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=("croaring-git")
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz::https://github.com/RoaringBitmap/CRoaring/archive/refs/tags/v$pkgver.tar.gz)
noextract=()
sha256sums=('73dd38565ab68c210d72d80bf13eebaf01431950b8d74b8dd0f2e82170c0ccdb')
validpgpkeys=()

build() {
	cd "CRoaring-$pkgver"
	mkdir -p build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_ROARING_TESTS=OFF
	cmake --build . --parallel
}

package() {
	cd "CRoaring-$pkgver/build"
	DESTDIR="$pkgdir" cmake --install .
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"	# Installing CRoaring's LICENSE by hand.
}
