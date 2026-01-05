# Maintainer: Adrian <adrian@mxlinux.org>
# Note: Uses tags from the 'arch' branch
pkgname=mx-packageinstaller
pkgver=26.01.1
pkgrel=2
pkgdesc="MX Package Installer - a tool for managing packages and Flatpak"
arch=("x86_64")
url="https://github.com/MX-Linux/mx-packageinstaller"
license=("GPL")
depends=("qt6-base" "xdg-utils" "sudo" "socat")
makedepends=("cmake" "ninja" "qt6-tools")
source=("https://github.com/MX-Linux/mx-packageinstaller/archive/refs/tags/26.01.1.tar.gz")
sha256sums=('ce903236be6b5191df76ffc9eff9fb80b0f6a2adf8b52b0d65cec5712bdc1605')

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
