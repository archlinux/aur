# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=hmr
pkgver=0.4.0
pkgrel=1
pkgdesc="A slim, fast CLI for Home Assistant"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/hmr"
license=('MIT')
provides=('hmr')
conflicts=('hmr-bin')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/byteowlz/hmr/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/hmr" "${pkgdir}/usr/bin/hmr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
