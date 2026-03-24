# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=seetui
pkgver=0.1.0
pkgrel=1
pkgdesc='see (Service Event Extraction) is a TUI based tool to lookup logs from services (systemd)'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/NustyFrozen/SEE'
license=('GPL-3.0')
makedepends=('cargo')
provides=('seetui')
conflicts=('seetui-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e8a34764f749de0bebf28d518f3f920a91d3c8a3eb9b843829615478c39ad115')

prepare() {
    cd "SEE-$pkgver/SEE"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "SEE-$pkgver/SEE"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "SEE-$pkgver/SEE"
    install -Dm0755 'target/release/SEE' "$pkgdir/usr/bin/seetui"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
    # install -Dm644 "$pkgdir/usr/share/doc/$pkgname/README.md" README.MD
}

# vim: ts=4 sw=4 et:
