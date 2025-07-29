# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=motd
pkgver=1.3.3
pkgrel=1
pkgdesc='Dynamically generate system information for MOTD SSH banner'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('hddtemp: to probe hard drive temperatures'
            'systemd: to display failed units')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('10f98cb8f8e589718900db193ee34eec58d26b00afdbe7ad457693e32add75c9556dae4bd6765d6b77569d7acad52063e3d1e5b3e764d4b14381aed5097287d2')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
