# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=vulkan-headers
pkgname=mingw-w64-${_pkgname}
_dirname=Vulkan-Headers
pkgver=1.4.363.0
pkgrel=1
pkgdesc='Vulkan header files (mingw-w64)'
arch=(any)
url='https://www.khronos.org/vulkan/'
license=('Apache-2.0' 'MIT')
makedepends=(mingw-w64-cmake ninja)
groups=('mingw-w64-vulkan-devel')
options=(!buildflags staticlibs !strip)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/${_dirname}/archive/refs/tags/vulkan-sdk-${pkgver}.tar.gz")
sha256sums=('4a078be12bef21cfebc09d878b77a63cff9d68f899254a0b00d0e37ef73e7f7e')

_srcdir="${_dirname}-vulkan-sdk-${pkgver}"
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}"
    cmake --build "build-${_arch}"
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
  done
}
