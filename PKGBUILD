pkgname=baml
pkgver=0.2.1
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'gcc')
provides=('baml')
conflicts=('baml-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-wrapper-0.2.1.tar.gz")
sha256sums=('b641e2418819613c702b35436cb543a67054682cc67b877e97119dcf005d9180')

prepare() {
    cd "baml-baml-wrapper-0.2.1/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-wrapper-0.2.1/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --bin baml --features no-self-update
}

package() {
    cd "baml-baml-wrapper-0.2.1/baml_language"
    install -Dm755 "target/release/baml" "$pkgdir/usr/bin/baml"
}
