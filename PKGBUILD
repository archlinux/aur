# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker
pkgver=1.3.1
pkgrel=1
pkgdesc='A simple TUI budget tracker. Designed to track income and expenses and help visualize and gather basic insights from your transactions.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/Feromond/budget_tracker_tui'
license=('GPL-3.0')
makedepends=('cargo')
options=(!lto)
provides=('budget-tracker')
conflicts=('budget-tracker-git' 'budget-tracker-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b41125e1e90984360e546c13a9e5c464c4bce1154514b28209bc53d0351344dc')

prepare() {
    cd "budget_tracker_tui-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "budget_tracker_tui-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "budget_tracker_tui-$pkgver"
    install -Dm0755 target/release/Budget_Tracker "$pkgdir/usr/bin/budget-tracker"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
