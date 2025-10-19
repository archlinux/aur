# Maintainer: Thijzert123 <184778919+Thijzert123@users.noreply.github.com>

pkgname="packrinth"
pkgver="0.8.2"
pkgrel="1"
pkgdesc="CLI tool for creating and maintaining your own Minecraft modpack."
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://packrinth.thijzert.nl"
license=("MIT")
makedepends=("cargo")
options=("!lto")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")

# https://crates.io/api/v1/crates/packrinth/versions to find the checksum
sha256sums=("dee348eb9ce3426df0cc6787aba4e6f182af6914da9593112286ba616843e399")

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
