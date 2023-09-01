# Maintainer: taotieren <admin@taotieren.com>

pkgname=sudo-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="A memory safe implementation of sudo and su."
arch=('any')
url="https://github.com/memorysafety/sudo-rs"
license=('Apache 2.0', 'MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(sudo)
depends=()
makedepends=(cargo
    clang
    pam)
backup=()
options=('!strip' '!lto')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d1e6bdfc8f14a6023328ffd48a00f7c973409e7bdc6199f484c095ad9817090')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo build --release --all-features
}

# check() {
#     export RUSTUP_TOOLCHAIN=stable
#     export CARGO_TARGET_DIR=target
#
#     cd "${srcdir}/${pkgname}-${pkgver}/"
#     cargo test --release --all-features
# }

package() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
