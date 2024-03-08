pkgname=mingw-w64-spirv-headers
pkgver=1.3.275.0
pkgrel=1
pkgdesc='SPIR-V Headers (mingw-w64)'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('Apache')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/vulkan-sdk-${pkgver}/spirv-headers-${pkgver}.tar.gz")
sha256sums=('d46b261f1fbc5e85022cb2fada9a6facb5b0c9932b45007a77fe05639a605bd1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Headers-vulkan-sdk-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DSPIRV_HEADERS_SKIP_EXAMPLES=ON
    make -C build-${_arch}
  done
}

package() {
  cd "${srcdir}/SPIRV-Headers-vulkan-sdk-${pkgver}"
  for _arch in ${_architectures}; do
    make -C build-${_arch} DESTDIR="${pkgdir}" install
  done
}
