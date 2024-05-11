# Maintainer: trixsama <trix+aur at gmail.com>

_pkgname=grav1synth
pkgname=${_pkgname}-git
pkgver=0.1.0.beta.6.r6.gb877ba1
pkgrel=1
pkgdesc="Grain Synth analyzer and editor for AV1 files"
arch=('x86_64')
url="https://github.com/rust-av/grav1synth"
license=('MIT')
depends=('vapoursynth' 'vapoursynth-plugin-lsmashsource')
makedepends=('cargo' 'git' 'clang')
provides=('grav1synth')
conflicts=('grav1synth')
source=("git+https://github.com/rust-av/grav1synth.git")
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
    install -Dm755 "target/release/grav1synth" \
        -t "$pkgdir/usr/bin"
}
