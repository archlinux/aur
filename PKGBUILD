pkgname=mingw-w64-wine
pkgver=1
pkgrel=3
arch=('any')
pkgdesc="Wine wrapper for MinGW (mingw-w64)"
depends=('wine' 'xorg-server-xvfb')
license=("MIT")
url="http://fedoraproject.org/wiki/MinGW"
source=("mingw-wine.sh")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" mingw-wine.sh > ${_arch}-wine
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  for _arch in ${_architectures}; do
    install -m 755 ${_arch}-wine "${pkgdir}"/usr/bin/
  done
}

