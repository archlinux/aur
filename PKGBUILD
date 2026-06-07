# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tuxedo
pkgver=2026.6.1
pkgrel=1
pkgdesc='A fast, keyboard-driven terminal UI for todo.txt.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/webstonehq/tuxedo'
license=('MIT')
depends=(
    'glibc'
    'libgcc'
)
makedepends=('cargo')
options=(
    !strip
    !debug
)
provides=('tuxedo')
conflicts=('tuxedo-git' 'tuxedo-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f13861610b6aa11fb840caff4d05d4bbdfd07d1f51c536d6c452339695c8bec5')

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
    install -Dm0755 target/release/tuxedo "$pkgdir/usr/bin/tuxedo"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
