# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=starpsx
pkgver=0.8.3
pkgrel=1
pkgdesc="A cross-platform Sony PlayStation 1 emulator written in Rust"
arch=('x86_64')
url="https://github.com/kaezrr/starpsx"
license=('GPL-3.0-or-later')
depends=('libgcc')
makedepends=('cargo' 'libasound.so' 'libudev.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('aa4d0ea152f6728da411fb6ae35cd87fdafadef361f9fc4e942d9454e13171ed'
            '83894f4b29ffdfa2790c4c593a395192839eff447bee3983c9ea49b81474bd04')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}

