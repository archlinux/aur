# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Qichen Liu [@qichenliu]

pkgname=asciit
pkgver=1.0.0
pkgrel=1
pkgdesc="A more compact and intuitive ASCII table highlighting digits and letters"
arch=('x86_64')
url="https://github.com/Q1CHENL/asciit"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Q1CHENL/asciit/archive/refs/tags/v${pkgver}.tar.gz")
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/asciit" "${pkgdir}/usr/bin/asciit"
}
