# Maintainer: yiming564 <yiming564@proton.me>
pkgname=croaring
pkgver=5.5.5
pkgrel=1
epoch=
pkgdesc="Roaring bitmaps in C (and C++), with SIMD (AVX2, AVX-512 and NEON) optimizations: used by Apache Doris, ClickHouse, Alibaba Tair, Redpanda, YDB and StarRocks"
arch=('x86_64')
url="https://github.com/RoaringBitmap/CRoaring"
license=('Apache-2.0' 'MIT')
groups=()
depends=("glibc")
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
sha256sums=('f78a93b8cf373fe4a3d31075cf2b3dc21dcfd7bbbc17674df35071ec8e461aef')
validpgpkeys=()

build() {
	cd "CRoaring-$pkgver"
	mkdir -p build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_ROARING_TESTS=OFF -DBUILD_SHARED_LIBS=ON
	cmake --build . --parallel
}

package() {
	cd "CRoaring-$pkgver/build"
	DESTDIR="$pkgdir" cmake --install .
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"	# Installing CRoaring's LICENSE by hand.
}
