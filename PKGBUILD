# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime-git
pkgver=y2020.09.29+47.g8a477786f1
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=(x86_64)
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=(Apache)
depends=(gcc-libs lld)
source=("git+$url")
sha256sums=('SKIP')
provides=(wasm-micro-runtime)
conflicts=(wasm-micro-runtime)

pkgver() {
  cd wasm-micro-runtime
  git describe --tags --abbrev=10 | sed 's/^WAMR-\([0-9]\+\)-\([0-9]\+\)-\([0-9]\+\)-\([0-9]\+\)-g\([0-9a-f]\+\)$/y\3.\1.\2+\4.g\5/g'
}

build() {
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S wasm-micro-runtime/product-mini/platforms/linux/ -B build

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
