# Maintainer: Adrian <adrian@mxlinux.org>
# Note: Uses tags from the 'arch' branch
pkgname=mx-packageinstaller
pkgver=26.01
pkgrel=1
pkgdesc="Package installation tool for MX Linux"
arch=("x86_64")
url="https://github.com/MX-Linux/mx-packageinstaller"
license=("GPL")
depends=("qt6-base" "xdg-utils" "sudo" "socat")
makedepends=("cmake" "ninja" "qt6-tools")
source=("https://github.com/MX-Linux/mx-packageinstaller/archive/refs/tags/26.01.tar.gz")
sha256sums=('aabe8501eb444e60bf333c404eaa754bef15af1e69cd597c058df68bde6d3b22')

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
