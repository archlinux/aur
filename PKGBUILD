# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tuicr
pkgver=0.15.0
pkgrel=1
pkgdesc='a terminal UI for local code review'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/agavra/tuicr'
license=('MIT')
makedepends=(
    'cargo'
)
options=(!lto !debug)
provides=('tuicr')
conflicts=(
    'tuicr-git'
    'tuicr-bin'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c50ea6c4b48f76dc96b83b23c0efe945aebb92d37c3181c3f8852b2e059d346')

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
    install -Dm0755 target/release/tuicr "$pkgdir/usr/bin/tuicr"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
