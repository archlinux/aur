# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-conversation-search
pkgver=1.7.0
pkgrel=1
pkgdesc="CLI + MCP tool for searching Claude Code conversation history with Tantivy/BM25"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/claude-conversation-search-mcp"
license=('GPL-3.0-only')
makedepends=('cargo')
options=('!lto')
validpgpkeys=('E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc")
sha256sums=('d9fd2bf3ddf0347f58da61526a7e953a252b6e00f42e9bb2750bca54108c978d'
            'SKIP')

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
