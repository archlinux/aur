# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=epick
pkgver=0.7.0
pkgrel=1
epoch=
pkgdesc="Color picker for creating harmonic color palettes"
arch=('x86_64')
url="https://github.com/vv9k/${pkgname}"
license=('GPLv3')
depends=()
makedepends=('cargo' 'rust')
provides=("$pkgname")
conflicts=()
sha256sums=('d01ab6974c9400adab452770e923821646c69c5493d0d2033e718fb06f0170e2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
