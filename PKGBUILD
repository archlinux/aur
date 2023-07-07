# Maintainer: coffeba  i8ehkvieл@mozmail.com

pkgname=hyprland-monitor-attached
pkgver=0.1.3
pkgrel=1
pkgdesc='Run bash script when you attach the monitor on Hyprland'
arch=('x86_64')
url="https://github.com/coffebar/$pkgname"
license=('MIT')
makedepends=(cargo)
depends=()
_commit=ebafefc
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver(){
    cd "$pkgname"
    pcregrep -o1 '^version = "(.*)"$' Cargo.toml
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    test -f /usr/bin/rustup && /usr/bin/rustup update --no-self-update $RUSTUP_TOOLCHAIN
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
