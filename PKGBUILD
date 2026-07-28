pkgname=baml
pkgver=0.2.3
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'gcc')
provides=('baml')
conflicts=('baml-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-wrapper-0.2.3.tar.gz")
sha256sums=('30099f47ca63b69b29fec0a99e81a1af992b56da73a435ae9e9c3f7022de8e91')

prepare() {
    cd "baml-baml-wrapper-0.2.3/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-wrapper-0.2.3/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --bin baml --features no-self-update
}

package() {
    cd "baml-baml-wrapper-0.2.3/baml_language"
    install -Dm755 "target/release/baml" "$pkgdir/usr/bin/baml"
}
