pkgname=mingw-w64-wine-xmlpatterns
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Wine wrapper for xmlpatterns (mingw-w64)"
depends=('mingw-w64-wine' 'mingw-w64-qt5-xmlpatterns')
license=("MIT")
url="http://fedoraproject.org/wiki/MinGW"
source=("wine-xmlpatterns.sh")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" wine-xmlpatterns.sh > ${_arch}-xmlpatterns
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  for _arch in ${_architectures}; do
    install -m 755 ${_arch}-xmlpatterns "${pkgdir}"/usr/bin/
  done
}

