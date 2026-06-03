pkgname=baml
pkgver=0.11.0.alpha.4717
pkgrel=1
pkgdesc="BAML - the language for agents (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'gcc')
provides=('baml')
conflicts=('baml-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-language-0.11.0-alpha.4717.tar.gz")
sha256sums=('8505e9ccd2f0e91c20779d4de94c80446393828299b6e4fe9cc39c7dd078fe4f')

prepare() {
    cd "baml-baml-language-0.11.0-alpha.4717/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-language-0.11.0-alpha.4717/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --bin baml-cli
}

package() {
    cd "baml-baml-language-0.11.0-alpha.4717/baml_language"
    install -Dm755 "target/release/baml-cli" "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
