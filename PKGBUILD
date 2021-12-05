# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=dockeye
pkgver=0.1.0
pkgrel=2
epoch=
pkgdesc="GUI app to manage Docker"
arch=('x86_64')
url="https://github.com/vv9k/${pkgname}"
license=('GPLv3')
depends=('libxcb' 'gcc-libs')
makedepends=('cargo')
provides=("$pkgname")
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5a2bb2ae5972cdea193b24e9b315352181e48001c58fb6846abcb6e5a3936c67')

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
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
