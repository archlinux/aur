pkgname=mingw-w64-spirv-headers
pkgver=1.3.250.1
pkgrel=1
pkgdesc='SPIR-V Headers (mingw-w64)'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('Apache')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-${pkgver}.tar.gz")
sha256sums=('d5f8c4b7906baf9c51aedbbb2dd942009e8658e3340c6e64699518666a03e043')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Headers-sdk-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DSPIRV_HEADERS_SKIP_EXAMPLES=ON
    make -C build-${_arch}
  done
}

package() {
  cd "${srcdir}/SPIRV-Headers-sdk-${pkgver}"
  for _arch in ${_architectures}; do
    make -C build-${_arch} DESTDIR="${pkgdir}" install
  done
}
