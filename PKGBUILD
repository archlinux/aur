pkgname=mingw-w64-wine-qt
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Wine wrapper for Qt executables (mingw-w64)"
depends=('mingw-w64-wine' 'mingw-w64-qt5-xmlpatterns' 'mingw-w64-qt5-tools')
license=("MIT")
url="http://fedoraproject.org/wiki/MinGW"
source=("wine-xmlpatterns.sh" "wine-qhelpgenerator.sh")
sha256sums=('SKIP' 'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" wine-xmlpatterns.sh > ${_arch}-xmlpatterns
    sed "s|@TRIPLE@|${_arch}|g" wine-qhelpgenerator.sh > ${_arch}-qhelpgenerator
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  for _arch in ${_architectures}; do
    install -m 755 ${_arch}-xmlpatterns "${pkgdir}"/usr/bin/
    install -m 755 ${_arch}-qhelpgenerator "${pkgdir}"/usr/bin/
  done
}

