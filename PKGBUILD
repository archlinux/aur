#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=slopecraft
pkgname=${_pkgname}
pkgver=5.3.3
pkgrel=0
pkgdesc="Map Pixel Art Generator for Minecraft"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/SlopeCraft/SlopeCraft"
license=('GPL3')
makedepends=('clang' 'cmake' 'ninja' 'eigen' 'git' 'xsimd' 'qt6-tools' 'opencl-headers' 'opencl-clhpp' 'cereal' 'boost' 'tl-expected' 'cli11')
depends=('gcc-libs' 'glibc' 'libpng' 'libzip' 'zlib' 'zstd' 'qt6-base' 'openmp' 'ocl-icd' 'boost-libs')
optdepends=('opencl-nvidia: nvidia GPU boosting',
            'intel-compute-runtime: Intel GPU boosting',
            'rocm-opencl-runtime: AMD GPU boosting',
            'opencl-clover-mesa: GPU boosting with mesa')
source=(https://github.com/SlopeCraft/SlopeCraft/archive/refs/tags/v5.3.3.tar.gz)
b2sums=('7f2307a4fd03f1b08a4a123b72cd53ea68edb6897e1cce455ec55a30dd15030be5e4af077719684f900f43a000912998b305947f2a4f3e57c95edcbc2891db9d')

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
