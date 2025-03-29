pkgname=mingw-w64-spirv-headers
epoch=1
pkgver=1.4.309.0
pkgrel=1
pkgdesc='SPIR-V Headers (mingw-w64)'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('Apache')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/vulkan-sdk-${pkgver}/spirv-headers-${pkgver}.tar.gz")
sha256sums=('a96f8b4f2dfb18f7432e5c523e220ab0075372a9509e0c25fbff21c76af0de7c')

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
