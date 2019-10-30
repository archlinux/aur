# Maintainer: bronson mathews <bronsonmathews@gmail.com> -> http://bit-shift.io -> https://github.com/bit-shift-io
pkgname=audiobook-git
pkgver=r36.1eb2c89
pkgrel=1
pkgdesc="A simple audio book reader. Written in Qt and C++."
arch=('x86_64')
url="https://github.com/bit-shift-io/audiobook"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'qt5-tools' 'qt5-multimedia' 'taglib')
provides=('audiobook')
source=("${pkgname}::git+https://github.com/bit-shift-io/audiobook.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  mkdir -p build
  cd "${srcdir}/${pkgname}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make install INSTALL_ROOT="${pkgdir}/"
}
