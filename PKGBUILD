# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=valheim-mod-manager
pkgver=0.4.0
pkgrel=1
pkgdesc='A command-line tool for managing and automatically downloading Valheim mods and their dependencies'
url='https://github.com/Endoze/valheim-mod-manager'
license=("MIT")
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/endoze/valheim-mod-manager/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('8395579f055f013b51a68516cf244cf334c76011366aa7e82274b8df0d7c69377118523ad3bc6aeaeb369e39346b3d09302887b4639fff43b351f7840f48dbae')
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
