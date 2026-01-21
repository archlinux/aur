# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=aarty
pkgver=0.7.1
pkgrel=2
pkgdesc='Simple CLI tool to convert the images to ASCII art'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/0x61nas/aarty"
license=('MIT')
makedepends=('cargo')
provides=('aarty')
conflicts=('aarty-git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
    "LICENSE::https://raw.githubusercontent.com/0x61nas/aarty/refs/tags/v$pkgver/LICENSE.txt"
    "$pkgname-$pkgver.tar.gz.asc"
    'LICENSE.asc')
sha256sums=('67d09d9943914ec4be667eb007fd6aa90215b2d80ad510a9ace383665c05f771'
            'e8cecbd1f336ea7e652afeb29f6049772f47fee75db5761632a028e51766c608'
            'SKIP'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/aarty"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
    # install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

