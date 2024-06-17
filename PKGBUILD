# Maintainer: dominikwilkowski <hi at dominik-wilkowski dot com>
# vim: ts=2 sw=2 et:

pkgname=cfonts
pkgver=1.2.0rust
pkgrel=1
pkgdesc='Sexy ANSI fonts for the console'
arch=('any')
url='https://github.com/dominikwilkowski/cfonts'
license=('GPL-3.0-or-later')
makedepends=('rust' 'make')
provides=('cfonts')
source=("https://github.com/dominikwilkowski/cfonts/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8337423201558b43ae48e0749058a58623700cfb777288f3a520dcdb0d723a6f')

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
