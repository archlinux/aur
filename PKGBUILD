# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=rustmission
pkgver=0.5.1
pkgrel=1
pkgdesc='Performant TUI for Transmission capable of managing hundreds of torrents.'
url='https://github.com/intuis/rustmission'
license=(GPL-3.0-or-later)
makedepends=('cargo')
depends=()
optdepends=('ttf-font-nerd: Nerd Font for icons')
arch=('x86_64')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('f9020f9323b2c2925efd3352a41d218f78b59855a57a2438a32ac5001ef75865761b06b52af9e5fe2f6098f9cdd931b2fd50747bc457b32ca5b577c2214e01ef')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
