# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=wtfi2
pkgver=0.6.0
pkgrel=1
pkgdesc='Live, visual network-path diagnostic that pinpoints exactly where your Wi-Fi connection dies'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/kanywst/wtfi2'
license=('MIT')
makedepends=('cargo')
options=(
    '!lto'
    '!debug'
)
provides=('wtfi')
conflicts=('wtfi2-git' 'wtfi2-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('230396dbb1b49830b42ffaf8a390e0faad60999bf0b3a2f59f7a511746235ba9')

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
    install -Dm0755 target/release/wtfi "$pkgdir/usr/bin/wtfi"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
