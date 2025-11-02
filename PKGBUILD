# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=ccusage-statusline-rs
pkgver=1.3.0
pkgrel=1
pkgdesc="Ultra-fast Rust statusline for Claude Code with real-time usage tracking, billing blocks, and burn rate monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/ccusage-statusline-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("https://github.com/ticpu/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('77081e8848124bdf90e3502956b77e80a298b7ffa392cd5596cc7e53f5027886')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
