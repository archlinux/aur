# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=mermaid-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast native Rust Mermaid diagram renderer. No browser required."
url="https://github.com/1jehuang/mermaid-rs-renderer"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/1jehuang/mermaid-rs-renderer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b512e5e7f259a9efe1ba968a28acbbcf144adc6f0f1423758401636de64e807e')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')

prepare() {
    cd "mermaid-rs-renderer-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "mermaid-rs-renderer-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "mermaid-rs-renderer-$pkgver"
    install -Dm755 "target/release/mmdr" "$pkgdir/usr/bin/mmdr"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/mermaid-rs/README.md"
}
