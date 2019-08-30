# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=wasmtime
pkgver=0.3.0
pkgrel=1
pkgdesc="Standalone JIT-style runtime for WebAssembly, using Cranelift"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/CraneStation/wasmtime"
license=('APACHE2')
depends=()
makedepends=('cargo')
options=()
source=("https://github.com/CraneStation/wasmtime/archive/v${pkgver}.tar.gz")
sha384sums=('c043bf58f24a174d832b14b4aa1a6de17cd608648753da65c64f33254e79df913ce0e709abcd9645e71ebed4c2134360')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "target/release/wasm2obj" "$pkgdir/usr/bin/wasm2obj"
    install -Dm755 "target/release/wast" "$pkgdir/usr/bin/wast"
}
