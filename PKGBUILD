# Maintainer: Cedric Krause <cedware-dev@protonmail.com>
pkgname=bountui
pkgver=0.13.3
pkgrel=20
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
source=("https://github.com/Cedware/bountui/archive/refs/tags/v0.13.3.tar.gz")
noextract=()
sha256sums=('3e52dbd3fb1e0e82ce6fcaa088e1901c0a431cf132c2a0538271228634b279b7')
validpgpkeys=()

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CFLAGS="" CXXFLAGS=""
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build(){
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="" CXXFLAGS=""
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
