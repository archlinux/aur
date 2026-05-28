# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=xdelta3-gui
pkgver=26.05.2
pkgrel=1
pkgdesc="GUI for xdelta3 application"
arch=("x86_64")
url="https://github.com/AdrianTM/xdelta3-gui"
license=("GPL")
depends=("qt6-base" "qt6-svg" "xdelta3")
makedepends=("cmake" "ninja" "qt6-tools")
install=xdelta3-gui.install
source=("https://github.com/AdrianTM/xdelta3-gui/archive/refs/tags/26.05.2.tar.gz")
sha256sums=('c3c9d02b675d8e3a53f981856360db5fc691e88c2548730d1d18d0d8722eb07c')

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
