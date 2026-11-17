# shellcheck shell=bash disable=SC2034
# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgname=ztty
pkgver=0.1.2
pkgrel=1
pkgdesc='Lightweight no_std Rust terminal emulator for X11 and XWayland'
arch=('x86_64')
url='https://github.com/LIghtJUNction/ztty'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libx11' 'libxft' 'libxrender')
makedepends=('rustup')
optdepends=('xdg-utils: open hyperlinks' 'ttf-dejavu: default monospace font')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d866a566f43a3e7fd806faa0e06dc3bb10fc71372cd11cd4cb5cd01b50b3500a')

prepare() {
    cd "$pkgname-$pkgver" || return
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname-$pkgver" || return
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver" || return
    cargo test --frozen --workspace --lib
}

package() {
    cd "$pkgname-$pkgver" || return
    install -Dm755 target/release/ztty "$pkgdir/usr/bin/ztty"
    install -Dm644 assets/ztty.desktop "$pkgdir/usr/share/applications/ztty.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
