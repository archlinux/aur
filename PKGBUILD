# Maintainer: bronson mathews <bronsonmathews@gmail.com> -> http://bitshift.io -> https://github.com/bit-shift-io
pkgname=audiobook-git
pkgver=r123.e5f4c56
pkgrel=1
pkgdesc="A simple audio book reader. Written in QT/QML and C++."
arch=('any')
url="https://github.com/bit-shift-io/audiobook"
license=('GPL3')
depends=('qt5-declarative')
makedepends=('cmake' 'git' 'qt5-tools' 'qt5-multimedia' 'qt5-svg')
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
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../README.md
}
