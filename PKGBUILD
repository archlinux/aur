# Maintainer: paypur <pieceofpaypur at gmail dot com>

pkgname=region_scanner
pkgver=0.3.8
pkgrel=1
epoch=
pkgdesc="A CLI program to scan Minecraft region files and create Just Enough Resources world-gen.json files from the results"
arch=("x86_64")
url="https://github.com/RundownRhino/RegionScanner"
license=("GPL-3.0-only")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/RundownRhino/RegionScanner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d898703e30b084cc72d987cbaf35229bb018da5ff9706f179d7a43a44ab38c71') #generate with "makepkg -g"

_base=RegionScanner

prepare() {
    cd "$_base-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$_base-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_base-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}