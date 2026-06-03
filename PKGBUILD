pkgname=baml
pkgver=0.1.0
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'gcc')
provides=('baml')
conflicts=('baml-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-wrapper-0.1.0.tar.gz")
sha256sums=('bcfb0297e5f8c37338daf9fb24f51f526c60d38fd56c536f0e66981951a72fdc')

prepare() {
    cd "baml-baml-wrapper-0.1.0/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-wrapper-0.1.0/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --bin baml
}

package() {
    cd "baml-baml-wrapper-0.1.0/baml_language"
    install -Dm755 "target/release/baml" "$pkgdir/usr/bin/baml"
}
