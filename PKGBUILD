pkgname=mingw-w64-vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.2.158
pkgrel=1
pkgdesc="Vulkan header files (mingw-w64)"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(mingw-w64-cmake)
groups=("mingw-w64-vulkan-devel")
options=(!buildflags staticlibs !strip)
source=("https://github.com/KhronosGroup/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('53361271cfe274df8782e1e47bdc9e61b7af432ba30acbfe31723f9df2c257f3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/${_pkgname}-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
  done
}
