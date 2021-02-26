# Maintainer: bronson mathews <bronsonmathews@gmail.com> -> http://bitshift.io -> https://github.com/bit-shift-io
pkgname=qweather-git
pkgver=r82.20fd982
pkgrel=1
pkgdesc="A simple weather application. Using BOM Australia weather provider. Written in QT/QML and C++."
arch=('any')
url="https://github.com/bit-shift-io/qweather"
license=('GPL3')
depends=('qt5-declarative')
makedepends=('git' 'cmake' 'qt5-svg')
provides=('qweather')
source=("${pkgname}::git+https://github.com/bit-shift-io/qweather.git")
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
