# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=xdelta3-gui
pkgver=26.01
pkgrel=1
pkgdesc="GUI for xdelta3 application"
arch=("x86_64")
url="https://github.com/AdrianTM/xdelta3-gui"
license=("GPL")
depends=("qt6-base" "qt6-svg" "xdelta3")
makedepends=("cmake" "ninja" "qt6-tools")
install=xdelta3-gui.install
source=("https://github.com/AdrianTM/xdelta3-gui/archive/refs/tags/26.01.tar.gz")
sha256sums=('98d17efe033e57a4e6a6824739839c44fac2afb494447fca14ab2e5ff49999a2')

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
