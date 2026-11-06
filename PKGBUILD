#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=mc-schem
pkgname=${_pkgname}
pkgver=1.4.0
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
	https://github.com/SlopeCraft/mc_schem/archive/refs/tags/v1.4.0.tar.gz
)
sha512sums=(
	'ced200ed1f94e085a390458f88609e155269abf8b7061e1c6150aa782dd75b95b6874501397cede7a8236b74b08d0fb58df6553d3fea1c3aac44b9dfeb44079a'
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
