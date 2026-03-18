# Maintainer: Cedric Krause <cedware-dev@protonmail.com>
pkgname=bountui
pkgver=0.9.1
pkgrel=12
pkgdesc="A terminal-based user interface for interacting with HashiCorp Boundary"
arch=("any")
url="https://github.com/Cedware/bountui"
license=("GPL-3.0")
groups=()
depends=()
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=("bountui")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Cedware/bountui/archive/refs/tags/v0.9.1.tar.gz")
noextract=()
sha256sums=("1f1bcec064088d9c4525081baf15e90c2ca9eba663d200570a5babd8a76b1803")
validpgpkeys=()

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build(){
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
