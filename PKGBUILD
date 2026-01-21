# Maintainer: Cedric Krause <cedware-dev@protonmail.com>
pkgname=bountui
pkgver=0.8.0
pkgrel=10
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
source=("https://github.com/Cedware/bountui/archive/refs/tags/v0.8.0.tar.gz")
noextract=()
sha256sums=("07ea06bcfa822102c3e0b6d5c6ca4e6025728e0b714644bc1b8b6cfc22fa271c")
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
