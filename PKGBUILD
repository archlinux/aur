# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=classfi
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple classical music player'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/carmiac/classfi'
license=('GPL-3.0')
depends=('mpv')
makedepends=('cargo')
provides=('classfi')
conflicts=('classfi-git' 'classfi-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fb434015cda05adbeb92871118a2d716af049f2ede1700f9f7b74ae352cbc84')

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
    install -Dm0755 target/release/classfi "$pkgdir/usr/bin/classfi"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
