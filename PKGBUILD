# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-packageinstaller
pkgver=25.12.4
pkgrel=1
pkgdesc="Package installation tool for MX Linux"
arch=("x86_64")
url="https://github.com/MX-Linux/mx-packageinstaller"
license=("GPL")
depends=("qt6-base" "qt6-network" "qt6-xml" "xdg-utils" "sudo" "socat")
makedepends=("cmake" "ninja" "qt6-tools")
source=("https://github.com/MX-Linux/mx-packageinstaller/archive/refs/tags/${pkgver}.tar.gz")
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