# Maintainer: dominikwilkowski <hi at dominik-wilkowski dot com>
# vim: ts=2 sw=2 et:

pkgname=cfonts
pkgver=1.1.0rust
pkgrel=1
pkgdesc='Sexy ANSI fonts for the console'
arch=('any')
url='https://github.com/dominikwilkowski/cfonts'
license=('GPL-3.0-or-later')
makedepends=('rust' 'make')
provides=('cfonts')
source=("https://github.com/dominikwilkowski/cfonts/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('45c40dfc867234efc5c5a2df687ccfc40a6702fa5a82f2380b555f9e755508e6')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/rust"
    make
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release
}

package() {
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/rust/target/release/cfonts" "${pkgdir}/usr/bin/cfonts"
}
