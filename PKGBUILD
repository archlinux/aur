pkgname=mingw-w64-opencl-headers
pkgver=2024.10.24
pkgrel=1
pkgdesc="OpenCL (Open Computing Language) header files (mingw-w64)"
arch=(any)
url="https://github.com/KhronosGroup/OpenCL-Headers"
groups=("mingw-w64-vulkan-devel")
license=('Apache-2.0')
makedepends=(mingw-w64-cmake)
options=(!buildflags !debug staticlibs !strip)
source=("https://github.com/KhronosGroup/OpenCL-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('159f2a550592bae49859fee83d372acd152328fdf95c0dcd8b9409f8fad5db93')

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
