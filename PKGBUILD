# Maintainer: dominikwilkowski <hi at dominik-wilkowski dot com>
# vim: ts=2 sw=2 et:

pkgname=cfonts
pkgver=1.1.4rust
pkgrel=1
pkgdesc='Sexy ANSI fonts for the console'
arch=('any')
url='https://github.com/dominikwilkowski/cfonts'
license=('GPL-3.0-or-later')
makedepends=('rust' 'make')
provides=('cfonts')
source=("https://github.com/dominikwilkowski/cfonts/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('49228dc3dd4529bd86d537f46c8aa9a47043f060ec7d050e5cb739a030222407')

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
