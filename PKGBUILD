# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=wasmtime
pkgver=0.19.0
pkgrel=1
pkgdesc="Standalone JIT-style runtime for WebAssembly, using Cranelift"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/bytecodealliance/wasmtime"
license=('APACHE2')
depends=()
makedepends=('cargo')
options=()
source=("${pkgname}-${pkgver}::git+https://github.com/bytecodealliance/wasmtime.git#tag=v${pkgver}")
sha384sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --bin wasmtime
    cargo build --release --manifest-path crates/c-api/Cargo.toml
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "target/release/lib${pkgname}.so" "$pkgdir/usr/lib/lib${pkgname}.so"
}
