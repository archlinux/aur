# Maintainer: Andrew Kozik <andrewkoz at live dot com>
pkgname=xwin
pkgver=0.3.1
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=('x86_64')
url="https://crates.io/crates/xwin"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('79db6a9fc6b665feccd1984e4e21ff588102652c317176fab0d6706b55d3e208')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
