# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=nnd
pkgver=0.34
pkgrel=1
pkgdesc="A debugger for Linux"
arch=('x86_64')
url="https://github.com/al13n321/nnd"
source=("nnd::git+https://github.com/al13n321/nnd#tag=v${pkgver}")
b2sums=('SKIP')
makedepends=('cargo' 'rust-musl' 'musl' 'git')
license=("Apache-2.0")
_target='x86_64-unknown-linux-musl'

prepare() {
    cd "$pkgname" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target $_target
}

build() {
    cd "$pkgname" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --target $_target
}

check() {
    cd "$pkgname" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features --target $_target
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname}/target/${_target}/release/${pkgname}"
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
