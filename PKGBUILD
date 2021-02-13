pkgname=mingw-w64-vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.2.169
pkgrel=1
pkgdesc="Vulkan header files (mingw-w64)"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(mingw-w64-cmake)
groups=("mingw-w64-vulkan-devel")
options=(!buildflags staticlibs !strip)
source=("https://github.com/KhronosGroup/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e1acfa36056a2fa73ddc01bdac416d0188c880161e2073bbd5a86c8fbbc9bdbf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
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
