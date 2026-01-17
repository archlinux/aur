# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=xdelta3-gui
pkgver=26.01.3
pkgrel=2
pkgdesc="GUI for xdelta3 application"
arch=("x86_64")
url="https://github.com/AdrianTM/xdelta3-gui"
license=("GPL")
depends=("qt6-base" "qt6-svg" "xdelta3")
makedepends=("cmake" "ninja" "qt6-tools")
install=xdelta3-gui.install
source=("https://github.com/AdrianTM/xdelta3-gui/archive/refs/tags/26.01.3.tar.gz")
sha256sums=('9cc8e3040d63ce38b0850cc000eb7993a287ecf7372802cf799503dc8042e215')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build

  cmake -G Ninja .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

  ninja
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  DESTDIR="${pkgdir}" ninja install
}
