# Maintainer: ahab-schoeneberg <code at schoeneberge dot eu>
pkgname=animolauncher-git
pkgver=0.4.0_beta
pkgrel=1
pkgdesc="GUI for launching applications, written in blazingly fast Rust!"
arch=('x86_64')
url="https://codeberg.org/AnimoUtils/animolauncher"
license=('GPL-2.0-only')
makedepends=(cargo)
source=("https://codeberg.org/AnimoUtils/animolauncher/archive/dev.tar.gz")
sha512sums=("21ff9b33fd6691f4f1945c5b15e90c89415850d6ec917bc2eeeccd06d83fc5ee5626855b5536abe7757042849e86ca5b65972f9bed8fb6c4458510414f732d8a")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

