# Maintainer: xomvio <xomvio at proton dot me>
#

pkgname=watermarker
pkgver=0.2.2
pkgrel=1
pkgdesc="A CLI tool for adding watermark to images."
url="https://github.com/xomvio/watermarker"
license=("GPL-3.0-or-later")
arch=("x86_64")
depends=("gcc-libs" "glibc")
makedepends=(cargo)
provides=("watermarker")
conflicts=("watermarker")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("8a2252518bb9496499c57a9a4393e7fd041ee3d849d74f3566e412d5d32af117")


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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
