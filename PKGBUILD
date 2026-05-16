# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=scriptor
pkgver=1.1.0
pkgrel=1
pkgdesc='Local speech-to-text CLI & TUI.'
arch=('x86_64' 'aarch64')
url='https://github.com/giacomopiccinini/scriptor'
license=('MIT')
makedepends=('cargo')
options=(!lto !debug)
provides=('scriptor')
conflicts=('scriptor-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06437a2ec83583c90effd93a78f1301dbc20f18f1a3ff13a3259e3a72aae9571')

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
