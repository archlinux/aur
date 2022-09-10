# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime
pkgver=1.0.0
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=(x86_64)
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=(Apache)
depends=(gcc-libs lld)
makedepends=(cmake ninja)
source=("git+$url#tag=WAMR-$pkgver")
source=("$url/archive/refs/tags/WAMR-$pkgver.tar.gz")
sha256sums=('b5c147f91fe02b3457188bf7067ecfd7e00d91c65a08bdd629e65999422a78c4')

build() {
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S $pkgname-WAMR-$pkgver/product-mini/platforms/linux/ \
    -B build

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
