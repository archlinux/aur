# Maintainer: Saumit Dinesan <justsaumit@protonmail.com>
_realname=license-generator
pkgname=gen-license
pkgver=0.1.3
pkgrel=4
pkgdesc='Create licenses for your projects right from your terminal! license-generator on github by nexxeln'
arch=('x86_64')
url="https://github.com/nexxeln/license-generator"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        'LICENSE')
md5sums=('e67be4eea13e9d152b12d72d92c3be0d'
         'SKIP')

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
       install -Dm755 "target/release/gen-license" "$pkgdir/usr/bin/$pkgname"
       install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"
       install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
