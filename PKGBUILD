# Maintainer: dominikwilkowski <hi at dominik-wilkowski dot com>
# vim: ts=2 sw=2 et:

pkgname=cfonts
pkgver=1.0.4rust
pkgrel=1
pkgdesc='Sexy ANSI fonts for the console'
arch=('x86_64')
url='https://github.com/dominikwilkowski/cfonts'
license=('GPL-3.0-or-later')
makedepends=('rust' 'make')
provides=('cfonts')
source=("https://github.com/dominikwilkowski/cfonts/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8b82256e74091dc15570ccd1447259d27923cdb2eba16d26487b497518d33cc')

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
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/target/release/cfonts/rust" "${pkgdir}/usr/bin/cfonts"
}
