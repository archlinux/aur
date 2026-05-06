# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ratherapia
pkgver=0.1.1
pkgrel=1
pkgdesc='blends ambient sound, rain textures, reactive terminal particles, and an optional inline 3D rat scene into a quiet TUI instrument.'
arch=('x86_64' 'aarch64')
url='https://github.com/ozzyocak/ratherapia'
license=('MIT')
makedepends=('cargo')
provides=('ratherapia')
conflicts=('ratherapia-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7d6e71495ef591735a75312492c39d0dafa2ae66ce8f424f312338ec245532d')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/ratherapia "$pkgdir/usr/bin/ratherapia"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
