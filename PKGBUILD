# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=valheim-mod-manager
pkgver=0.3.0
pkgrel=1
pkgdesc='A command-line tool for managing and automatically downloading Valheim mods and their dependencies'
url='https://github.com/Endoze/valheim-mod-manager'
license=("MIT")
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/endoze/valheim-mod-manager/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6631b5396f26f1b5f08ed829fa79ee5f9ae898dfe23bd50b970d4c3cd82bddeffb70033a4da6ebface04776931ac93d953c80ffef9e48113d312cb94f70d9879')
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
