# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=vulkan-headers
pkgname=mingw-w64-${_pkgname}
_dirname=Vulkan-Headers
pkgver=1.4.303
pkgrel=1
pkgdesc='Vulkan header files (mingw-w64)'
arch=(any)
url='https://www.khronos.org/vulkan/'
license=('APACHE')
makedepends=(mingw-w64-cmake ninja)
groups=('mingw-w64-vulkan-devel')
options=(!buildflags staticlibs !strip)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/${_dirname}/archive/v${pkgver}.tar.gz")
sha256sums=('fdf0e2e05356b455137ff97f837c9689ba253ec7d20f87ad81575b9bdbe7fdd4')

_srcdir="${_dirname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

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
