pkgname=mingw-w64-wine
pkgver=1
pkgrel=10
arch=('any')
pkgdesc="Wine wrapper for MinGW (mingw-w64)"
# https://bugs.archlinux.org/task/77413
depends=('wine' 'libunwind')
license=("MIT")
url="http://fedoraproject.org/wiki/MinGW"
source=("mingw-wine.sh" "mingw-msiexec.sh" "mingw-winepath.sh")
sha256sums=('SKIP' 'SKIP' 'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" mingw-wine.sh > ${_arch}-wine
    sed "s|@TRIPLE@|${_arch}|g" mingw-msiexec.sh > ${_arch}-msiexec
    sed "s|@TRIPLE@|${_arch}|g" mingw-winepath.sh > ${_arch}-winepath
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  for _arch in ${_architectures}; do
    install -m 755 ${_arch}-wine "${pkgdir}"/usr/bin/
    install -m 755 ${_arch}-msiexec "${pkgdir}"/usr/bin/
    install -m 755 ${_arch}-winepath "${pkgdir}"/usr/bin/
  done
}

