pkgname=rlsp-yaml
pkgver=0.14.0
pkgrel=1
pkgdesc="A YAML language server implementing the Language Server Protocol."
arch=(x86_64)
url=https://github.com/chdalski/rlsp
license=(MIT)
depends=(libgcc glibc)
makedepends=(cargo)
options=(!lto)
source=("${pkgname%-yaml}-$pkgname-v$pkgver.tar.gz::https://github.com/chdalski/rlsp/archive/refs/tags/rlsp-yaml-v$pkgver.tar.gz")
sha256sums=('1464139b42fc4f83b8b5472dfe273c348b3828056e2a32b1ccddfa61a6738b1f')

prepare() {
    cd "${pkgname%-yaml}-$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname%-yaml}-$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features \
        --package rlsp-yaml
}

package() {
    cd "${pkgname%-yaml}-$pkgname-v$pkgver"
    install -Dvm755 target/release/$pkgname -t "$pkgdir/usr/bin"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
