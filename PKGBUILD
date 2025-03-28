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
sha512sums=("853046fefafa110802999f489aca2aa8cf5eb8aeb544950b92023019475f1bf1526b7e7d39c890df4017926aee3c21546f42eca11fe855e18f264f9076d91520")

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
