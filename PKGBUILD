# Maintainer: Adrian <adrian@mxlinux.org>
# Note: Uses tags from the 'arch' branch
pkgname=mx-packageinstaller
pkgver=26.01
pkgrel=1
pkgdesc="Package installation tool for MX Linux"
arch=("x86_64")
url="https://github.com/MX-Linux/mx-packageinstaller"
license=("GPL")
depends=("qt6-base" "qt6-network" "qt6-xml" "xdg-utils" "sudo" "socat")
makedepends=("cmake" "ninja" "qt6-tools")
source=("https://github.com/MX-Linux/mx-packageinstaller/archive/refs/tags/26.01.tar.gz")
sha256sums=('PLACEHOLDER_NEEDS_ACTUAL_CHECKSUM')

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