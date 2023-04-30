# Maintainer: scarlettekk <scarlett AT enby DOT site>
# Maintainer: willemw <willemw12@gmail.com>

pkgname=gdrive
pkgver=3.9.0
pkgrel=3
pkgdesc="Google Drive CLI Client (Rust rewrite)"
arch=('x86_64' 'aarch64')
url="https://github.com/glotlabs/gdrive"
license=('MIT')
options=('!lto')
makedepends=('git' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a4476480f0cf759f6a7ac475e06f819cbebfe6bb6f1e0038deff1c02597a275a')

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
