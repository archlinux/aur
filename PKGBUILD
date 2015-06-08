
pkgname=mingw-w64-cmake
pkgver=1
pkgrel=9
arch=(any)
pkgdesc="CMake wrapper for MinGW (mingw-w64)"
depends=('cmake' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("mingw-cmake.sh"
        "toolchain-mingw.cmake")
md5sums=('SKIP' 'SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" toolchain-mingw.cmake > toolchain-${_arch}.cmake
    sed "s|@TRIPLE@|${_arch}|g" mingw-cmake.sh > ${_arch}-cmake
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/mingw
  for _arch in ${_architectures}; do
    install -m 644 toolchain-${_arch}.cmake "${pkgdir}"/usr/share/mingw/
    install -m 755 ${_arch}-cmake "${pkgdir}"/usr/bin/
  done
}


