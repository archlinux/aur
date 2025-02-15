# Maintainer: xomvio <xomvio at proton dot me>

pkgname=watermarker
pkgver=0.2.4
pkgrel=1
pkgdesc='CLI tool for adding watermark to images'
url="https://github.com/xomvio/$pkgname"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1acaa4aca17681277addcfcdc4e64bd228e7500a7fd6aa1c819dbe5e797c8336')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
