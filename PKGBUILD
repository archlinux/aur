pkgname=mingw-w64-spirv-headers
pkgver=1.5.3
pkgrel=1
pkgdesc='SPIR-V Headers (mingw-w64)'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('Apache')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Headers/archive/$pkgver.tar.gz")
sha256sums=('eece8a9e147d37997d425d5d2eeb2e757ad25adc30d6651467094f3b18609b5a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Headers-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DSPIRV_HEADERS_SKIP_EXAMPLES=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SPIRV-Headers-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
  done
}
