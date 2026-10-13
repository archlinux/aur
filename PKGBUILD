# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=bdf
pkgver=1.1.0
pkgrel=1
pkgdesc='Btrfs Duplicate Finder'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7027c3980197285c039972cb3e63dac5fa20e2852d863d6ef4f114fae88004f0f0683a5575425481c2b814ade95f3ae07c8f2281f49ead403ace94ea345faa07')

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

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
