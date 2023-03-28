# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=aichat
pkgver=0.8.0
pkgrel=1
pkgdesc="Using ChatGPT/GPT-3.5/GPT-4 in the terminal"
arch=('i686' 'x86_64')
url="https://github.com/sigoden/aichat"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('aichat-bin' 'aichat-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9073d96afdab56ff51f392cffa8d04fd70d47602236bd10e58248de5594bfd2a')

    
prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

    install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"

    install -Dm 644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
