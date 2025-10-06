# Maintainer: Thijzert123 <184778919+Thijzert123@users.noreply.github.com>

pkgname="packrinth"
pkgver="0.8.0"
pkgrel="1"
pkgdesc="CLI tool for creating and maintaining your own Minecraft modpack."
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://packrinth.thijzert.nl"
license=("MIT")
makedepends=("cargo")
options=("!lto")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")

# https://crates.io/api/v1/crates/packrinth/versions to find the checksum
sha256sums=("f47b177c0cb9a64e0f6c3e6f2fbbc80562a7270046d0d191205a8f701f81dabd")

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
