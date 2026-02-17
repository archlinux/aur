# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=fitui
pkgver=0.1.5
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
sha256sums=('8ffa45b28eb3853996c09227734d04703bf29543a66508fb4b0fa93ce2c8e33b')

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
