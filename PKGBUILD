# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=valheim-mod-manager
pkgver=0.2.0
pkgrel=1
pkgdesc='A command-line tool for managing and automatically downloading Valheim mods and their dependencies.'
url='https://github.com/Endoze/valheim-mod-manager'
license=("MIT")
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/endoze/valheim-mod-manager/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('5c1dd9b0f2d4acaf5d2907c93733d5819cf40787523b8411c4b48351c30146e2aa5447f33f01f8f4fed8fb254219bd6efb3914737ea73279aa4f7cdef5b725bc')
options=(!lto)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/vmm"
}
