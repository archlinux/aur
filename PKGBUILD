pkgname=mingw-w64-opencl-headers
pkgver=2022.01.04
pkgrel=1
pkgdesc="OpenCL (Open Computing Language) header files (mingw-w64)"
arch=(any)
url="https://github.com/KhronosGroup/OpenCL-Headers"
groups=("mingw-w64-vulkan-devel")
license=('APACHE')
makedepends=(mingw-w64-cmake)
options=(!buildflags staticlibs !strip)
source=("https://github.com/KhronosGroup/OpenCL-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('6e716e2b13fc8d363b40a165ca75021b102f9328e2b38f8054d7db5884de29c9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/OpenCL-Headers-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTING=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/OpenCL-Headers-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
  done
}
