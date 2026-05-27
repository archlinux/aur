# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=swpui
pkgver=0.8.0
pkgrel=1
pkgdesc='Search and replace, TUI style.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/beeb/swpui'
license=(
     'Apache-2.0'
     'MIT'
)
makedepends=('cargo')
provides=('swp')
conflicts=('swpui-git' 'swpui-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0aa42e8d549de40477441ab8fa47f64cbe7933c90157ab7460c1bd22e78dc5e7')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/swp "$pkgdir/usr/bin/swp"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
