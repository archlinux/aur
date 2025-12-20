# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
pkgname=gridix
pkgver=1.1.0
pkgrel=1
pkgdesc="简洁、快速、安全的跨平台数据库管理工具，Helix/Vim 风格键位"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('MIT')
depends=('gtk3' 'xdotool')
makedepends=('cargo' 'git' 'clang' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MCB-SMART-BOY/Gridix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
