# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
pkgname=gridix
pkgver=2.0.2
pkgrel=1
pkgdesc="Fast, secure, cross-platform database management tool with Helix/Vim keybindings"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('Apache-2.0')
depends=('gtk3' 'xdotool')
makedepends=('cargo' 'git' 'clang' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MCB-SMART-BOY/Gridix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('733f0f557338a1e56d5aee15451f66187e28146b23354aa06e811eb8914e2703')

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
    install -Dm644 "gridix.desktop" "$pkgdir/usr/share/applications/gridix.desktop"
    install -Dm644 "gridix.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gridix.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
