# Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=slopecraft
pkgname=${_pkgname}
pkgver=5.2.2
pkgrel=1
pkgdesc="Map Pixel Art Generator for Minecraft"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/SlopeCraft/SlopeCraft"
license=('GPL3')
makedepends=('clang' 'cmake' 'ninja' 'eigen' 'git' 'xsimd' 'qt6-tools' 'opencl-headers' 'opencl-clhpp' 'cereal')
depends=('gcc-libs' 'glibc' 'fmt' 'libpng' 'libzip' 'zlib' 'qt6-base' 'openmp' 'ocl-icd')
optdepends=('opencl-nvidia: nvidia GPU boosting',
            'intel-compute-runtime: Intel GPU boosting',
            'rocm-opencl-runtime: AMD GPU boosting',
            'opencl-clover-mesa: GPU boosting with mesa')
source=(https://github.com/SlopeCraft/SlopeCraft/archive/refs/tags/v5.2.2.tar.gz)
b2sums=('17db0109a34c2b973bc16b60d4ddbaf098231fabcbe1a3d47f17cb047e11696c98c5307434bd64e22bcbc910db0c78c4be8878511f2f89815d224dab8d0f46b4')

build() {
	cmake -S SlopeCraft-$pkgver -B build \
		-G Ninja \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSlopeCraft_vectorize=ON \
		-DSlopeCraft_GPU_API="OpenCL"

	cmake --build build --parallel
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	
	cd "$pkgdir/usr"
	rm README.md
	rm README-en.md
	rm LICENSE
	rm LICENSE-zh.md
}
