# Maintainer: Pando85 <pando855@gmail.com>

pkgname=i3-auto-layout
pkgver=0.3.2
pkgrel=1
pkgdesc="Automatic, optimal tiling for i3wm "
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pando85/i3-auto-layout"
license=('GPL')
depends=('i3-wm')
makedepends=('cargo'
             'git')
source=("git+$url.git#tag=v${pkgver}?signed")
validpgpkeys=('C15CDDF9318F14398300B917C6CB8A1793CA3F94')
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/i3-auto-layout"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/i3-auto-layout"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/i3-auto-layout"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/i3-auto-layout"
}
