# Maintainer: ahab-schoeneberg <code at schoeneberge dot eu>
pkgname=animolauncher-git
pkgver=0.4.0_beta
pkgrel=4
pkgdesc="GUI for launching applications, written in blazingly fast Rust!"
arch=('x86_64')
url="https://codeberg.org/AnimoUtils/animolauncher"
license=('GPL-2.0-only')
makedepends=(cargo)
source=("https://codeberg.org/AnimoUtils/animolauncher/archive/dev.tar.gz")
sha512sums=("17ba3bbab37b2d89c1bb7b41832651f706953e1a92b6e02521f880e5e58dfdf95df88d3b013432d09980f9885c6c15b1fa88fd3d84cd5f41a6e98e073363adfd")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/animolauncher"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/animolauncher"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/animolauncher"
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/animolauncher/target/release/animolauncher"
}
