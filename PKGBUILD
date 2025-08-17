# Maintainer: Altynbek Orumbayev <aorumbayev@pm.me>
# 
# This is the source package for awesome-omarchy-tui, which builds the application 
# from source using the Rust toolchain. For a binary package (pre-compiled), 
# see awesome-omarchy-tui-bin.

pkgname=awesome-omarchy-tui
pkgver=0.3.8
pkgrel=1
pkgdesc="A beautiful terminal UI for browsing the awesome-omarchy repository with search, navigation, and GitHub integration"
arch=('x86_64')
url="https://github.com/aorumbayev/awesome-omarchy-tui"
license=('MIT')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aorumbayev/awesome-omarchy-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c065b7cdfc7d0677f40d6c07b245e11f5e0da9c9264d91fde177a52159f17130')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --no-default-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/awsomarchy"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
