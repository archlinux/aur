# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=swpui
pkgver=0.10.0
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
sha256sums=('ddd6b37a1399a097d0bdbd59b94c28f44c9e4801c35b32e66af739b504f33992')

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
