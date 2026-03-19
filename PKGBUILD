# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-conversation-search
pkgver=1.5.0
pkgrel=1
pkgdesc="CLI + MCP tool for searching Claude Code conversation history with Tantivy/BM25"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/claude-conversation-search-mcp"
license=('GPL-3.0-only')
makedepends=('cargo')
options=('!lto')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('c1deae87afd920648b56c63bd83be21dce771988962b1cab062ed497e4bf31e6')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
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
