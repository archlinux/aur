pkgname=mingw-w64-ldd
pkgver=1.1
pkgrel=1
arch=('any')
pkgdesc="Tool to list dependencies of a DLL"
depends=('python-mingw-ldd')
license=("MIT")
url="https://github.com/nurupo/mingw-ldd"
source=("mingw-ldd.sh")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" mingw-ldd.sh > ${_arch}-ldd
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  for _arch in ${_architectures}; do
    install -m 755 ${_arch}-ldd "${pkgdir}"/usr/bin/
  done
}
