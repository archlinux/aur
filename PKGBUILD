# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=aspeak
pkgver=6.0.0
pkgrel=1
pkgdesc="A simple text-to-speech client for Azure TTS API"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/kxxt/aspeak"
license=('MIT')
depends=('openssl' 'alsa-lib' 'gcc-libs')
makedepends=('cargo')
conflicts=('aspeak')
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
b2sums=('73edaca97050fd810fd5a8d2afc9841c574507f59179e16152fd8cd3ee88d5980f24b8445b15427fae7ca141b7744f02960deeff4bc20378a9233857d709fa67')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -F binary --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
