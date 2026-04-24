# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-lsp
pkgver=0.14.0
pkgrel=1
pkgdesc="Language server for Supersigil spec documents"
arch=('x86_64' 'aarch64')
url="https://github.com/jonisavo/supersigil"
license=('MIT' 'Apache-2.0')
makedepends=('cargo')
options=(!debug)
source=("supersigil-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "supersigil-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "supersigil-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p supersigil-lsp
}

package() {
    cd "supersigil-${pkgver}"
    install -Dm755 "target/release/supersigil-lsp" "${pkgdir}/usr/bin/supersigil-lsp"
}
