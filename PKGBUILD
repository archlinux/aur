# Maintainer: Andrew Kozik <andrewkoz at live dot com>
pkgname=xwin
pkgver=0.2.4
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=('x86_64')
url="https://crates.io/crates/xwin"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('69faac30f4548eef3c0bd1dc7a91fd245be7233909a6022904ddc1de0c99c6b7')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
