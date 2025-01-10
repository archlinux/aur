# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=rustmission
pkgver=0.5.1
pkgrel=2
pkgdesc='Performant TUI for Transmission capable of managing hundreds of torrents.'
url='https://github.com/intuis/rustmission'
license=(GPL-3.0-or-later)
makedepends=('cargo')
depends=()
optdepends=('ttf-font-nerd: Nerd Font for icons')
arch=('x86_64')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('6a1a99662da82cbfd5ae596d1c0219ec3a5d64118f7f95e4169ba88e49583a79')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
