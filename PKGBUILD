# Maintainer: Wren Arco <wren.arco@gmail.com>
pkgname=vesper-claude-allowlist-prune
pkgver=0.1.0
pkgrel=1
pkgdesc="Prune junk and duplicates from Claude Code allowlist settings"
arch=('x86_64')
url="https://github.com/Rinzlo/claude-allowlist-prune"
license=('MIT')
depends=()
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3db7fef0b39827c2c15d6b02acea85a877a5c9fd91c5f2fae8b64be8ea3765ae')

prepare() {
    cd "claude-allowlist-prune-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "claude-allowlist-prune-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "claude-allowlist-prune-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "claude-allowlist-prune-$pkgver"
    install -Dm755 target/release/claude-allowlist-prune "$pkgdir/usr/bin/claude-allowlist-prune"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
