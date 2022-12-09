# Maintainer: trixsama <trix+aur at gmail.com>
# Based off a PKGBUILD initially provided by someone amazing who wanted to stay anonymous

_pkgname=ssimulacra2_bin
pkgname=${_pkgname}-git
pkgver=0.3.4.r10.g1c3baf2
pkgrel=1
pkgdesc="Binary interface to the Rust implementation of the SSIMULACRA2 metric"
arch=('x86_64')
url="https://github.com/rust-av/ssimulacra2_bin"
license=('BSD-2')
depends=('vapoursynth' 'vapoursynth-plugin-lsmashsource')
makedepends=('cargo' 'git')
source=("git+https://github.com/rust-av/ssimulacra2_bin.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

prepare() {
    cd $_pkgname
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

 package() {
    cd $_pkgname
    install -Dm755 "target/release/ssimulacra2_rs" \
        -t "$pkgdir/usr/bin"
}
