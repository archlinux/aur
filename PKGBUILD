# Maintainer: Kartik Halkunde <your-email@example.com>
pkgname=crnch
pkgver=0.1.1
pkgrel=1
pkgdesc="Blazing-fast Rust CLI tool for intelligent PNG/JPG/PDF compression to target sizes"
arch=('x86_64' 'aarch64')
url="https://github.com/KartikHalkunde/crnch"
license=('MIT')
depends=('ghostscript' 'imagemagick' 'pngquant' 'jpegoptim' 'oxipng')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KartikHalkunde/crnch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3877842f38346d0355a576867630e1c466b9a5d2efa6f41a48d2473c685cdb76')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
