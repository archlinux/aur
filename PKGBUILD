# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libusbp-1
pkgver=1.1.0.r4.gaad19dc
pkgrel=1
pkgdesc="Pololu libusbp-1"
url="https://github.com/pololu/libusbp"
license=(custom)
arch=(i686 x86_64)
depends=()
makedepends=(cmake)
source=("git+https://github.com/pololu/libusbp.git")
sha256sums=(SKIP)

pkgver() {
  cd libusbp
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake 
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../libusbp
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../libusbp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
