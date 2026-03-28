# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=purple
pkgver=2.14.2
pkgrel=1
pkgdesc='TUI to search, connect and manage SSH servers. Visual file transfer, cloud sync (12 providers), password management. Edits ~/.ssh/config directly.'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/erickochen/purple'
license=('MIT')
depends=('openssh')
makedepends=('cargo')
options=(!lto)
provides=('purple')
conflicts=('purple-git' 'purple-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c86942d3d43ec142f7bc185dc7cb52a08ce6f8afa23bffbbefe9971dc694189')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t ${pkgdir}/usr/bin 'target/release/purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
