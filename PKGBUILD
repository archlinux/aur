pkgname=radix
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI program to convert numbers between binary, octal, decimal and hexadecimal."
arch=('x86_64')
url="https://github.com/zOrfeo/radix"
license=('MIT')
makedepends=('cmake')
depends=()
source=("radix-$pkgver.tar.gz::https://github.com/zOrfeo/radix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('13e9daca03345e10ce9488d3ae145afdbc844db36819c973120b7840f9bd9b79')

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
