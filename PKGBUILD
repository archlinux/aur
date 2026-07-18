pkgname=mingw-w64-spirv-headers
pkgver=1.4.350.1
pkgrel=1
pkgdesc="SPIR-V Headers (mingw-w64)"
arch=("any")
url="https://www.khronos.org/registry/spir-v/"
license=("Apache")
makedepends=("mingw-w64-cmake")
options=("!strip" "!buildflags" "staticlibs")
source=("https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/vulkan-sdk-${pkgver}/spirv-headers-${pkgver}.tar.gz")
sha512sums=("789fb10aa0c3a08934a6067dab1da09e93880e7c75575bf6054dc51df35416feb5daff73c7a3faf1681a2b33275315e44ef3665617fe75cdd18b991a8b7e9991")

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
