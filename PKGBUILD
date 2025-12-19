# Maintainer: MCB-SMART-BOY <your-email@example.com>
pkgname=gridix
pkgver=0.5.1
pkgrel=1
pkgdesc="简洁、快速、安全的跨平台数据库管理工具，Helix/Vim 风格键位"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('MIT')
depends=('gtk3' 'xdotool')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MCB-SMART-BOY/Gridix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('138e349be5cd8f8afbaa63e9a86747ba7850445ce7dac47fdd7868a420767597')

prepare() {
    cd "Gridix-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "Gridix-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "Gridix-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "Gridix-$pkgver"
    install -Dm755 "target/release/gridix" "$pkgdir/usr/bin/gridix"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
