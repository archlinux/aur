pkgname=mingw-w64-make
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Make wrapper for MinGW (mingw-w64)"
depends=('mingw-w64-gcc' 'mingw-w64-environment')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("mingw-make.sh")
sha256sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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

