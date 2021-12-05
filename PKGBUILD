# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=pkger-rs
_pkgname=pkger
pkgver=0.7.0
pkgrel=0
epoch=
pkgdesc='Build rpm, deb, pkg and other packages using Docker'
arch=('x86_64')
url="https://github.com/vv9k/${_pkgname}"
license=('MIT')
depends=()
makedepends=('cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('b1305ce0143ff31ad7bfb92deef4b1475f1cd092b687537ca95275733cc91462')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

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

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${PACKAGE_NAME}/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${PACKAGE_NAME}/LICENSE"
}
