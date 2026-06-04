pkgname=baml
pkgver=0.2.0
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'gcc')
provides=('baml')
conflicts=('baml-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-wrapper-0.2.0.tar.gz")
sha256sums=('e4e9a284a4afa3c22d4eb927dadab1639a7f1f4976f1a8b6ff2ae8942346adaf')

prepare() {
    cd "baml-baml-wrapper-0.2.0/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-wrapper-0.2.0/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --bin baml
}

package() {
    cd "baml-baml-wrapper-0.2.0/baml_language"
    install -Dm755 "target/release/baml" "$pkgdir/usr/bin/baml"
}
