pkgname=llvm-mingw-w64-configure
pkgver=0.1.1
pkgrel=11
arch=('any')
pkgdesc="configure wrapper for MinGW (mingw-w64) (i686, x86_64, armv7, and aarch64)"
depends=('llvm-mingw-w64-toolchain' 'llvm-mingw-w64-pkg-config' 'llvm-mingw-w64-environment')
conflicts=('mingw-w64-configure')
provides=('mingw-w64-configure')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("mingw-configure.sh")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32 armv7-w64-mingw32 aarch64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" mingw-configure.sh > ${_arch}-configure
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  for _arch in ${_architectures}; do
    install -m 755 ${_arch}-configure "${pkgdir}"/usr/bin/
  done
}
