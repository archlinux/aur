# Maintainer: Matthias Schlich
pkgname=snglrtty
pkgver=0.1.3
pkgrel=1
pkgdesc="Terminal audio visualizer — singularity in your TTY"
arch=('x86_64')
url="https://github.com/the-unknown/snglrtty"
license=('MIT')
depends=('libpulse')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/the-unknown/snglrtty/archive/v$pkgver.tar.gz")
sha256sums=('25312c4789b8419e63f0e9151be2bbbef8218e0a5c7c314b19030b2fdb5cd6ef')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/snglrtty" "$pkgdir/usr/bin/snglrtty"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
