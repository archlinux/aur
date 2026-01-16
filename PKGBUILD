# Maintainer: Birbwell <jmbirdwell.us@gmail.com>

pkgname=linuxmix-git
pkgver=0.1.0
pkgrel=1
arch=(any)
url=https://codeberg.org/Birbwell/linuxmix

pkgdesc="Implements SteelSeries' ChatMix feature in Linux."

sources=("linuxmix::git+https://codeberg.org/Birbwell/linuxmix")

depends=(pipewire-pulse)
makedepends=(cargo)

options=(strip !debug)

install=linuxmix.install

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin" "target/release/linuxmix"
}
