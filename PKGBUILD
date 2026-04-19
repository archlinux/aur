# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=classfi
pkgver=0.1.1
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
sha256sums=('a52e7398fd4c7cabb8566214aedda543d820f55750d6c62cb35877fad52176fb')

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
