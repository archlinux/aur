# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=xdelta3-gui
pkgver=26.02
pkgrel=1
pkgdesc="GUI for xdelta3 application"
arch=("x86_64")
url="https://github.com/AdrianTM/xdelta3-gui"
license=("GPL")
depends=("qt6-base" "qt6-svg" "xdelta3")
makedepends=("cmake" "ninja" "qt6-tools")
install=xdelta3-gui.install
source=("https://github.com/AdrianTM/xdelta3-gui/archive/refs/tags/26.02.tar.gz")
sha256sums=('f8a3cdf8bb224e976787214ddbc3c719b8aece565dfd59d161d77e6a6a76a80c')

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
