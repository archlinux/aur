# Maintainer: Sebastian Lau <lauseb644@gmail.com>

pkgname="linuxdeployqt"
pkgver=20180317
pkgrel=1
pkgdesc="Makes Linux applications self-contained by copying in the libraries and plugins that the application uses"
arch=('x86_64')
url="https://github.com/probonopd/linuxdeployqt"
license=('GPL3' 'LGPL3')
depends=('qt5-base' 'patchelf')
makedepends=('git' 'cmake')
provides=('linuxdeployqt')
_commit="37631e5640d8f7c31182fa72b31266bbdf6939fc"
source=("git+https://github.com/probonopd/linuxdeployqt.git#commit=${_commit}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}"
  [[ -e build ]] && rm -r build
  mkdir build
}

build() {
  cd "${srcdir}/build"
  cmake ../${pkgname}
  make
}

package() {
  cd "${srcdir}/build"

  install -d "${pkgdir}/usr/bin"
  install "tools/linuxdeployqt/linuxdeployqt" "${pkgdir}/usr/bin/linuxdeployqt"
}

# vim:set ts=2 sw=2 et:
