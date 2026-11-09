#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=mc-schem
pkgname=${_pkgname}
pkgver=1.4.1
pkgrel=1
pkgdesc="A rust/c++ library to generate, load, manipulate and save minecraft schematic files."
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/SlopeCraft/mc_schem"
license=('GPL-3.0-only')
options=(!debug)

makedepends=(
	rust # Any rust, either official rust/rustup/rust-nightly is ok
	cmake
	gcc
)
depends=(
	glibc
	gcc-libs
)
optdepends=(
)
source=(
	https://github.com/SlopeCraft/mc_schem/archive/refs/tags/v1.4.1.tar.gz
)
sha512sums=(
	'0a8979e5c259b344f0195e63d76f853ea282c2a909189569fcc5d31a9578538b26919b1aade629956d967f1c1258c87ba768e19de1dbdff824ec5d43abf3432a'
)

# prepare() {
# 	cd mc_schem-$pkgver
# 	patch -N -p1 -i "$srcdir/001-fix-install.patch"
# }

build() {
	cmake -S mc_schem-$pkgver -B build \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMC_SCHEM_ENABLE_TESTS=OFF \
		-DMC_SCHEM_ENABLE_EXAMPLES=OFF

	cmake --build build --parallel
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
