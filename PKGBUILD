pkgname=baml
pkgver=0.11.0.alpha.4281
pkgrel=1
pkgdesc="BAML - the language for agents (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'gcc')
provides=('baml')
conflicts=('baml-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-language-0.11.0-alpha.4281.tar.gz")
sha256sums=('a200bb66ae94433d7010c57f3bd8476a5f2880934028999e1f540f43511ed071')

prepare() {
    cd "baml-baml-language-0.11.0-alpha.4281/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-language-0.11.0-alpha.4281/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --bin baml-cli
}

package() {
    cd "baml-baml-language-0.11.0-alpha.4281/baml_language"
    install -Dm755 "target/release/baml-cli" "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
