# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=dockeye
pkgver=0.2.0
pkgrel=1
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
sha256sums=('222faa30c78ab2f77da1be6d46a5da01c47fc24ed7438aef9d7e42fded08ef22')

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
