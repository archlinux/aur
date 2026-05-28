# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tuxedo
pkgver=2026.5.12
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
options=(!strip)
provides=('tuxedo')
conflicts=('tuxedo-git' 'tuxedo-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a345e657f05d837db2282f1855d92c278b58463bf8e300f94b0670df2307229a')

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
