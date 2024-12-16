# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname='Transgender.rs'
pkgname='transgender'
pkgver=1.3.3
pkgrel=1
pkgdesc='Minimalistic terminal file explorer'
arch=('x86_64')
url="https://github.com/Sberm/$_pkgname"
license=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6062e3d8c978221353be86c0cbcad5e4a4b68197c0c4e4a00e658e0d65879166')
makedepends=('rustup')
depends=('glibc' 'gcc-libs')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
