pkgname=radix
pkgver=1.1.0
pkgrel=2
pkgdesc="CLI tool to convert numbers between binary, octal, decimal and hexadecimal."
arch=('x86_64')
url="https://github.com/zOrfeo/radix"
license=('MIT')
makedepends=('cmake')
depends=()
source=("radix-$pkgver.tar.gz::https://github.com/zOrfeo/radix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('394a1cdaa4317153846c827f6064c7bd7e88d525668e72752d418ad6c8e5c656')

build() {
  cd "$srcdir/radix-$pkgver"

  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  cd "$srcdir/radix-$pkgver"

  DESTDIR="$pkgdir" cmake --install build
}

check() {
  cd "$srcdir/radix-$pkgver"
  cmake -B build-tests -S . -DBUILD_TESTING=ON
  cmake --build build-tests
  ./build-tests/unit_tests
}
