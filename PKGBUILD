# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
# Maintainer: Eric Kochen <eric@getpurple.sh>
pkgname=purple
pkgver=3.12.3
pkgrel=1
pkgdesc='Terminal SSH manager with provider sync, tunnels, file transfer and containers'
arch=('x86_64' 'aarch64')
url='https://github.com/erickochen/purple'
license=('MIT')
depends=('gcc-libs' 'openssh')
makedepends=('cargo')
options=(!lto)
conflicts=('purple-git' 'purple-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e926011a3163e0027578ff55f50ca4a4917337b1febec15f5e6a4dc71ee452cb')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
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
    install -Dm0755 -t "$pkgdir/usr/bin" 'target/release/purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
