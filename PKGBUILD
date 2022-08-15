# Maintainer: Pando85 <pando855@gmail.com>

pkgname=timer-rs
pkgver=0.3.5
pkgrel=1
pkgdesc="Simple countdown terminal alarm"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pando85/timer"
license=('GPL')
depends=('gcc-libs'
         'pkg-config'
         'alsa-lib')
makedepends=('cargo'
             'git')
source=("git+$url.git#tag=v${pkgver}?signed")
validpgpkeys=('C15CDDF9318F14398300B917C6CB8A1793CA3F94')
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/timer"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/timer"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/timer"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/timer"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/timer"
}
