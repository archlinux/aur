# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=dealve
pkgver=1.0.2
pkgrel=1
pkgdesc='Delve into game deals from your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/kurama/dealve-tui'
license=('MIT' 'APACHE')
makedepends=('cargo')
provides=('dealve')
conflicts=('dealve-git' 'dealve-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7361e77437307ba967eba74afbdb771712160e5980b5f6d5dfb2deb624f2ad7')

prepare() {
    cd "dealve-tui-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "dealve-tui-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "dealve-tui-$pkgver"
    install -Dm0755 'target/release/dealve' "$pkgdir/usr/bin/dealve"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
