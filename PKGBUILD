# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=wleave
pkgver=0.5.1
pkgrel=2
pkgdesc="A Wayland-native logout script written in GTK4 "
arch=('x86_64')
url="https://github.com/AMNatty/wleave"
source=("wleave::git+https://github.com/AMNatty/wleave#tag=${pkgver}")
b2sums=('SKIP')
makedepends=('cargo' 'git')
license=("MIT")
conflicts=("wleave-git")

prepare() {
    cd "$pkgname" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked
}

build() {
    cd "$pkgname" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname}/target/release/${pkgname}"
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
