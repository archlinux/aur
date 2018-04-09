# Maintainer: bronson mathews <bronsonmathews@gmail.com> -> http://bit-shift.io -> https://github.com/bit-shift-io
pkgname=audiobook
pkgver=2018.04
pkgrel=1
pkgdesc="Audio Book is a simple audio book reader. Written in Qt and C++."
arch=('any')
url="https://github.com/bit-shift-io/audiobook"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
provides=('audiobook')
conflicts=()
source=("${pkgname}::git+https://github.com/bit-shift-io/audiobook.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git rev-parse --short HEAD
}

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  mkdir -p build
  cd "${srcdir}/${pkgname}/build"
  qmake ../audiobook.pro -r CONFIG+=release PREFIX=/usr 
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make install INSTALL_ROOT="${pkgdir}/"
}
