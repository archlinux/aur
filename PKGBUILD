# Maintainer: Altynbek Orumbayev <aorumbayev@pm.me>
#
# This is the source package for LazyLora, which builds the application
# from source using the Rust toolchain. For a binary package (pre-compiled),
# see lazylora-bin.

pkgname=lazylora
pkgver=0.5.0
pkgrel=1
pkgdesc="Unofficial terminal user interface for Algorand Blockchain exploration"
arch=('x86_64')
url="https://github.com/aorumbayev/lazylora"
license=('MIT')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aorumbayev/lazylora/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('43d480dc39e30552af4cfcb88fc1924ff6d2df9b9ccc1f775b6e5c66c04db96a')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/lazylora"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
