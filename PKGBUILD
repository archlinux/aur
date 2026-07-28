# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=xdelta3-gui
pkgver=26.07
pkgrel=1
pkgdesc="GUI for xdelta3 application"
arch=("x86_64")
url="https://github.com/AdrianTM/xdelta3-gui"
license=("GPL-3.0-or-later")
depends=("qt6-base" "qt6-svg" "xdelta3")
makedepends=("cmake" "ninja" "qt6-tools")
optdepends=("progress: show progress while creating patches")
source=("https://github.com/AdrianTM/xdelta3-gui/archive/refs/tags/26.07.tar.gz")
sha256sums=('3db6f060dc18993e79fd4ffb1af7c48c86c27432f85b99d5fdcbf40e1561d128')

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
