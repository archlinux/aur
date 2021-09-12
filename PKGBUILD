# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=hr-rust
pkgver=1.0.1
pkgrel=1
pkgdesc="hr in rust"
arch=("i686" "x86_64")
url="https://github.com/djmattyg007/hr-rust"
license=('custom:Public Domain')
source=("https://github.com/djmattyg007/hr-rust/archive/${pkgver}.tar.gz")
sha512sums=("b9976e57244e7d7842ebb893b6d1e9a424ef122fd4b50a8a89a485d53241562ec9634503ae38254424d8500b39d809017e2958419950d50fc61189573a548446")
makedepends=("cargo")
conflicts=("hr")
provides=("hr")

prepare() {
    cargo fetch --locked --manifest-path "hr-rust-${pkgver}/Cargo.toml"
}

check() {
    cd "hr-rust-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "hr-rust-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --locked --offline --all-features --root "${pkgdir}/usr/" --path .
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/hr-rust/LICENSE.txt"
    install -Dm644 README.txt "${pkgdir}/usr/share/doc/hr-rust/README.txt"
}
