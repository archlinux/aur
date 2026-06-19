# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ghr
pkgver=0.8.2
pkgrel=1
pkgdesc='GitHub in your terminal'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/chenyukang/ghr'
license=('MIT')
depends=('github-cli')
makedepends=('cargo')
options=(!lto !debug)
provides=('ghr')
conflicts=('ghr-git' 'ghr-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c537e19a85261c4b93d41c06fff298cddac2f0015eb1826da726b3a22e3f843')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/ghr "$pkgdir/usr/bin/ghr"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
