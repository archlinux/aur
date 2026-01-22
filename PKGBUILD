# Maintainer: NinjaTech404 <ninjatech404@gmail.com>
pkgname=enc
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple and straight forward c++ Encode/Decode CLI toolkit for everyday use"
arch=('x86_64')
url="https://github.com/NinjaTech404/enc"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git' "ninja")
source=("$pkgname-$pkgver.tar.gz::https://github.com/NinjaTech404/enc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"

  # Create a CMakeLists.txt that references the submodules
}

build() {
  cd "$pkgname-$pkgver"

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -G Ninja

  ninja
}

package() {
  cd "$pkgname-$pkgver/build"

  install -Dm755 enc "$pkgdir/usr/bin/enc"

  # Install license if available
  if [ -f ../LICENSE ]; then
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Install README if available
  if [ -f ../README.md ]; then
    install -Dm644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
