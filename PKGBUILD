# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=scriptor
pkgver=1.0.0
pkgrel=1
pkgdesc='Local speech-to-text CLI & TUI.'
arch=('x86_64' 'aarch64')
url='https://github.com/giacomopiccinini/scriptor'
license=('MIT')
makedepends=('cargo')
options=(!lto)
provides=('scriptor')
conflicts=('scriptor-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd6d726645c9f64406e327ec2110f0ae598f30a62dd8a5fcaa2045ce3b775f63')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 'target/release/scriptor' "${pkgdir}"/usr/bin/scriptor
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
