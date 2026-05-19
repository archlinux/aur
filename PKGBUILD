# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=intel-level-zero-raytracing-support
pkgver=1.2.4
pkgrel=1
pkgdesc="Intel oneAPI Raytracing Support"
arch=('x86_64')
url="https://github.com/intel/level-zero-raytracing-support"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cmake' 'ninja' 'git')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5ea2371faedf42855554f09250f6ffc46374037116ba812838c9edb49bd9e7e5')

prepare() {
	cd "${pkgname:6}-$pkgver"
}

build() {
	cd "$srcdir"
	cmake -B build -S "${pkgname:6}-${pkgver}" \
	-DCMAKE_BUILD_TYPE=None \
	-GNinja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

	cmake --build build
}


package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
