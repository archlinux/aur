# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=wasmtime
pkgver=0.8.0
pkgrel=1
pkgdesc="Standalone JIT-style runtime for WebAssembly, using Cranelift"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/CraneStation/wasmtime"
license=('APACHE2')
depends=()
makedepends=('cargo')
options=()
source=("https://github.com/CraneStation/wasmtime/archive/v${pkgver}.tar.gz")
sha384sums=('89005894df1d1a43a75636ed50637c8a5b9d22b17f67e4a3d9c26188d32fd76d7e10fbc3af7826648c5306318b670810')

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
