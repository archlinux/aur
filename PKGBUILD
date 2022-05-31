# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=pkger-rs
_pkgname=pkger
pkgver=0.8.0
pkgrel=1
epoch=
pkgdesc='Build rpm, deb, pkg and other packages using Docker'
arch=('x86_64')
url="https://github.com/vv9k/${_pkgname}"
license=('MIT')
depends=()
makedepends=('cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('f59b6afd3c4b6238bd2e4ba4eaa5a2325481666ce7d3d26be061bce3d7747d87')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

prepare() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
