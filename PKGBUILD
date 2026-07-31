# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smyx
pkgver=0.2.7
pkgrel=1
pkgdesc='Navidrome player for the terminal. With reactive themes.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/ayanchavand/Smyx'
license=('MIT')
makedepends=('cargo')
options=(
    !lto
    !debug
)
provides=('smyx')
conflicts=('smyx-git' 'smyx-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3be874394b78e9bd66f65c888322dfcc7645b22396c74b780c7e5e24f7056982')

prepare() {
    cd "Smyx-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "Smyx-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "Smyx-${pkgver}"
    install -Dm0755 target/release/smyx "$pkgdir/usr/bin/smyx"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
