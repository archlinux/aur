# Maintainer: scarlettekk <scarlett AT enby DOT site>
# Maintainer: willemw <willemw12@gmail.com>

pkgname=gdrive
pkgver=3.9.1
pkgrel=3
pkgdesc="Google Drive CLI Client (Rust rewrite)"
arch=('x86_64' 'aarch64')
url="https://github.com/glotlabs/gdrive"
license=('MIT')
options=('!lto')
makedepends=('git' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9aadb1b9a23d83f5aaa785960973bef1c63b85346de6be01a36e0630f2ddec1c')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target="$CARCH-unknown-linux-gnu"
}

#check() {
#    cd $pkgname-$pkgver
#    export RUSTUP_TOOLCHAIN=stable
#    export CARGO_TARGET_DIR=target
#    cargo test --frozen --all-features
#}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
