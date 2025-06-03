# Maintainer: ahab-schoeneberg <code at schoeneberge dot eu>
pkgname=animolauncher-git
pkgver=0.4.0_beta
pkgrel=3
pkgdesc="GUI for launching applications, written in blazingly fast Rust!"
arch=('x86_64')
url="https://codeberg.org/AnimoUtils/animolauncher"
license=('GPL-2.0-only')
makedepends=(cargo)
source=("https://codeberg.org/AnimoUtils/animolauncher/archive/dev.tar.gz")
sha512sums=("d022dab8ae371da98caa462e5be86cf6456eb7ff18754c7506f0fb6d75a29b48d2ff202b5eba15e842354fa1b628b154c3ad27142af91b57820c2293dc0b60ec")

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
