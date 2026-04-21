# Maintainer:
# Contributor: codepunk <codepunk AT noreply DOT codeberg DOT org>

pkgname=hltb
pkgver=0.4.0
pkgrel=1
pkgdesc="HowLongToBeat CLI tool"
arch=('x86_64')
url="https://codeberg.org/codepunk/how-long-to-beat-cli"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}"
    install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
