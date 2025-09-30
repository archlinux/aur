# Maintainer: Thijzert123 <184778919+Thijzert123@users.noreply.github.com>

pkgname="packrinth"
pkgver="0.7.6"
pkgrel="1"
pkgdesc="CLI tool for creating and maintaining your own Minecraft modpack."
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://packrinth.thijzert.nl"
license=("MIT")
makedepends=("cargo")
options=("!lto")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=("dfcc0c63df14d4bdbb42c5de5a04deec3d81ccdb2b30f96262178868672ddad1")

build() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --locked --release
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm0755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    find "site" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
