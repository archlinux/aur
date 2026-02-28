# Maintainer: Wren Arco <wren.arco@gmail.com>
pkgname=vesper-claude-cost
pkgver=0.1.0
pkgrel=1
pkgdesc="Claude Code cost tracker — per-project and per-model breakdowns"
arch=('x86_64')
url="https://github.com/Rinzlo/claude-cost"
license=('MIT')
depends=()
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dce11ba77b9a17e68397bff3723be48b44f52b0bf0526382c2e6a710b5e06668')

prepare() {
    cd "claude-cost-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "claude-cost-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "claude-cost-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "claude-cost-$pkgver"
    install -Dm755 target/release/claude-cost "$pkgdir/usr/bin/claude-cost"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
