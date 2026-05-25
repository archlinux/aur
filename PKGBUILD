# Maintainer: Cedric Krause <cedware-dev@protonmail.com>
pkgname=bountui
pkgver=0.13.1
pkgrel=18
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
source=("https://github.com/Cedware/bountui/archive/refs/tags/v0.13.1.tar.gz")
noextract=()
sha256sums=('250e1508479ed2c05304baea96590a1c400ad275e69544ddfb67de5d8660d449')
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
