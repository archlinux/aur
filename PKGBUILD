# Maintainer: Daniel Menelkir <dmenelkir@gmail.com>

_pkgname="wttrbar"
pkgname="wttrbar-git"
pkgver=0.093c253
pkgrel=0
pkgdesc="Weather indicator for Waybar"
url="https://github.com/bjesus/wttrbar"
arch=("any")
license=("MIT")
makedepends=('rust')
provides=('wttrbar')
conflicts=('wttrbar')
source=("git+$url")
sha512sums=("SKIP")

prepare() {
    mv $_pkgname/* .
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

