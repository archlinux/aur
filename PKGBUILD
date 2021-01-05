pkgname=mingw-w64-spirv-headers
pkgver=1.5.4
pkgrel=1
pkgdesc='SPIR-V Headers (mingw-w64)'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('Apache')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Headers/archive/$pkgver.raytracing.fixed.tar.gz")
sha256sums=('df2ad2520be4d95a479fa248921065885bbf435a658349a7fc164ad7b26b68c6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Headers-${pkgver}.raytracing.fixed
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DSPIRV_HEADERS_SKIP_EXAMPLES=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SPIRV-Headers-${pkgver}.raytracing.fixed/build-${_arch}"
    make DESTDIR="${pkgdir}" install
  done
}
