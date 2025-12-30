# Maintainer: byteowlz
pkgname=mmry-cuda
pkgver=0.8.0
pkgrel=1
pkgdesc="A lean, local-first memory management system for humans and AI agents (with CUDA support)"
arch=('x86_64')
url="https://github.com/byteowlz/mmry"
license=('MIT')
depends=('gcc-libs' 'cuda')
makedepends=('rust' 'cargo' 'protobuf')
optdepends=('cudnn: for improved neural network performance')
conflicts=('mmry')
provides=('mmry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/mmry/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "mmry-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --features cuda
}

package() {
    cd "mmry-$pkgver"
    install -Dm755 target/release/mmry "$pkgdir/usr/bin/mmry"
    install -Dm755 target/release/mmry-mcp "$pkgdir/usr/bin/mmry-mcp"
    install -Dm755 target/release/mmry-tui "$pkgdir/usr/bin/mmry-tui"
    install -Dm755 target/release/mmry-service "$pkgdir/usr/bin/mmry-service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
