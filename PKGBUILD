# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=seetui
pkgver=0.1.7
pkgrel=1
pkgdesc='see (Service Event Extraction) is a TUI based tool to lookup logs from services (systemd)'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/NustyFrozen/SEE'
license=('GPL-3.0')
makedepends=('cargo')
provides=('seetui')
conflicts=('seetui-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2e1b82a5dc74df72a61d2ad4c1d117d8f1789472c88b3896dc80f5d84d703655')

prepare() {
    cd "SEE-$pkgver/"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "SEE-$pkgver/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "SEE-$pkgver/"
    install -Dm0755 'target/release/seetui' "$pkgdir/usr/bin/seetui"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
