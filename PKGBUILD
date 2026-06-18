# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=owl-write
pkgver=0.5.0
pkgrel=1
pkgdesc='Quick spellcheck TUI'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://codeberg.org/jpt/owl-write'
license=('GPL-3.0-or-later')
makedepends=('cargo')
options=(
    !debug
    !strip
)
provides=('owl')
conflicts=('owl-write-git')
source=("${pkgname}-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4082d6aaf4906c70163b65801d25fc9957c57bc90e2f2910878f03b99db78a54')

prepare() {
    cd "${pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}"
    install -Dm0755 target/release/owl "$pkgdir/usr/bin/owl"
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
