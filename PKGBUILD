#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=mc-schem
pkgname=${_pkgname}
pkgver=1.4.2
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
	https://github.com/SlopeCraft/mc_schem/archive/refs/tags/v1.4.2.tar.gz
)
sha512sums=(
	'39de9a76e8b53e05b544f06c68ece30421295e19bcab3a767ca146dcd5a11184b3430ef9b7306b156f4d0265f2b50f4f5ba4d2de5b8aba468ed14dacda05d787'
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
