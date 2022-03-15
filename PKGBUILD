pkgname=mingw-w64-cli11
_pkgname=CLI11
pkgver=2.1.2
pkgrel=1
pkgdesc='Command line parser for C++11 (mingw-w64)'
arch=('any')
url='https://github.com/CLIUtils/CLI11'
license=('CUSTOM')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/CLIUtils/CLI11/archive/v${pkgver}.zip")
sha256sums=('01321456ee9987a833b49325ca99570fdfaa9c44bcab9e4d735b4afb554bad49')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCLI11_BUILD_TESTS=OFF \
      -DCLI11_BUILD_EXAMPLES=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
  done 
}
