#!/usr/bin/env bash
# Maintainer: JeremyStarTM <jeremystartm@staropensource.de>

pkgname=microsoft-edit
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern version of the MS-DOS Editor with a modern UI and keybindings similar to VS Code"
arch=("any")
url="https://git.staropensource.de/JeremyStarTM/aur-microsoft-edit"
license=("GPL-3.0-or-later")
sha512sums=("SKIP")
source=("git+https://github.com/microsoft/edit.git")
makedepends=("cargo")

# Configure rustup toolchain
: "${RUSTUP_TOOLCHAIN:="nightly"}"
export RUSTUP_TOOLCHAIN

prepare() {
    cd "edit"
    git checkout "v${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "edit"
    export CARGO_TARGET_DIR="target"
    cargo build --frozen --release --bin edit
}

package() {
    cd "edit"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 target/release/edit "${pkgdir}/usr/bin/microsoft-edit"
}
