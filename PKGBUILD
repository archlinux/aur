# Maintainer: Saumit Dinesan <justsaumit@protonmail.com>
_realname=license-generator
pkgname=gen-license
pkgver=0.1.2
pkgrel=3
pkgdesc="Create licenses for your projects right from your terminal!"
arch=('x86_64')
url="https://github.com/nexxeln/license-generator"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
md5sums=('b227d2e73609cb388657dc9df9ac8d31')
validpgpkeys=('86395E99314F4E382517AF976558C915A20CDD93')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
       cd "$pkgname-$pkgver"
       install -Dm755 "target/release/gen-license" "$pkgdir/usr/bin/gen-license"
       install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"
}
