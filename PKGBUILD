pkgname=mingw-w64-opencl-headers
pkgver=2021.06.30
pkgrel=1
pkgdesc="OpenCL (Open Computing Language) header files (mingw-w64)"
arch=(any)
url="https://github.com/KhronosGroup/OpenCL-Headers"
groups=("mingw-w64-vulkan-devel")
license=('APACHE')
makedepends=(mingw-w64-cmake)
options=(!buildflags staticlibs !strip)
source=("https://github.com/KhronosGroup/OpenCL-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('6640d590c30d90f89351f5e3043ae6363feeb19ac5e64bc35f8cfa1a6cd5498e')

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
