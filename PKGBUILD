# Maintainer: Birbwell <jmbirdwell.us@gmail.com>

pkgname=linuxmix-git
pkgver=0.1.3
pkgrel=1
arch=(any)
url=https://codeberg.org/Birbwell/linuxmix

pkgdesc="Implements SteelSeries' ChatMix feature in Linux."

source=("linuxmix::git+https://codeberg.org/Birbwell/linuxmix")
sha256sums=(SKIP)

depends=(pipewire-pulse)
makedepends=(cargo)

options=(strip !debug)

install=linuxmix.install

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd linuxmix
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd linuxmix
    cargo build --release --frozen --all-features
}

package() {
    cd linuxmix
    install -Dm0755 -t "$pkgdir/usr/bin" "target/release/linuxmix"
}
