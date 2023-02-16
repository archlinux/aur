# Maintainer: Andrew Kozik <andrewkoz at live dot com>
pkgname=xwin
pkgver=0.2.10
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=('x86_64')
url="https://crates.io/crates/xwin"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('5c53c43cb1b0385c4e1482f160cd72e4e43b8a9f436a42e3f539480c52056492')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
