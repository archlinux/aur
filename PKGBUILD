# Co-maintainer: scarlettekk <scarlett AT enby DOT site>
# Co-maintainer: willemw <willemw12@gmail.com>

pkgname=gdrive
pkgver=3.9.0
pkgrel=1
pkgdesc="Google Drive CLI Client (Rust rewrite)"
arch=('x86_64' 'aarch64')
url="https://github.com/glotlabs/$pkgname"
license=('MIT')
makedepends=('git' 'cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a4476480f0cf759f6a7ac475e06f819cbebfe6bb6f1e0038deff1c02597a275a')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

