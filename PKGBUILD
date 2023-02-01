# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dotenv-linter
pkgver=3.3.0
pkgrel=1
pkgdesc="Lightning-fast linter for .env files. Written in Rust"
arch=('x86_64')
url="https://github.com/dotenv-linter/dotenv-linter"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ffcd2f0d5bb40a19ea747ad7786fea796a7454f51e6da8f37fec572da8ae3c5f')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
