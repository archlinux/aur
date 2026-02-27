# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=fitui
pkgver=0.3.0
pkgrel=1
pkgdesc='Terminal-based personal finance tracker'
arch=('x86_64' 'aarch64')
url='https://github.com/ayanchavand/FiTui'
license=('MIT')
makedepends=('cargo')
provides=('fitui')
conflicts=('fitui-git' 'fitui-bin')
options=(!lto)
source=("FiTui-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b154545447b4ec9c0b7f67e4e648fd6ca81e62f2cb3e6da9fd17e2200a6a6ec')

prepare() {
    cd "FiTui-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "FiTui-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "FiTui-$pkgver"
    install -Dm0755 'target/release/fitui' "${pkgdir}"/usr/bin/fitui
    # install -Dm644 -t "$pkgdir/usr/share/licenses/FiTui/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/FiTui/" README.md
}

# vim: ts=4 sw=4 et:
