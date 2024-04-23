pkgname=llvm-mingw-w64-make
pkgver=1
pkgrel=5
arch=('any')
pkgdesc="Make wrapper for MinGW (mingw-w64) (i686, x86_64, armv7, and aarch64)"
depends=('llvm-mingw-w64-toolchain' 'mingw-w64-environment')
conflicts=('mingw-w64-make')
provides=('mingw-w64-make')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("mingw-make.sh")
sha256sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32 armv7-w64-mingw32 aarch64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" mingw-make.sh > ${_arch}-make
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  for _arch in ${_architectures}; do
    install -m 755 ${_arch}-make "${pkgdir}"/usr/bin/
  done
}

