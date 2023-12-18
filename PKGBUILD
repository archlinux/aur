# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=vulkan-headers
pkgname=mingw-w64-${_pkgname}
_dirname=Vulkan-Headers
pkgver=1.3.273
pkgrel=1
pkgdesc='Vulkan header files (mingw-w64)'
arch=(any)
url='https://www.khronos.org/vulkan/'
license=('APACHE')
makedepends=(mingw-w64-cmake)
groups=('mingw-w64-vulkan-devel')
options=(!buildflags staticlibs !strip)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/${_dirname}/archive/v${pkgver}.tar.gz")
sha256sums=('b46c77265a0b0f235a3df755742bab273fe2083ddd52b2134e8f4c7ad3154a43')

_srcdir="${_dirname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}"
    cmake --build "build-${_arch}"
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
  done
}
