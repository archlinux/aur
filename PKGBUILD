# Maintainer: Anthony Vitacco <breaker1@protonmail.com>
pkgname=snescom
pkgver=1.8.1.1
pkgrel=3
pkgdesc='This program reads symbolic 65816 or 65c816 machine code and compiles (assembles) it into a relocatable object file, into an IPS patch, or directly into a raw file.'
arch=('i686' 'x86_64')
url='https://bisqwit.iki.fi/source/snescom.html'
license=('GPL')
depends=('gcc')
makedepends=('gcc')
changelog=${pkgname}.changelog
source=("https://bisqwit.iki.fi/src/arch/${pkgname}-${pkgver}.tar.xz")
sha512sums=(
    'b8fbd8d5a1bcefd0251d21e4f6219f5cdb832b3a6499668b6c72c8b8872954b66afbc447e11dcf7bb614cd0d3ee5fa416e63498e4b0644f950754cea66840bb4'
)

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}/
    sed -i "s/usr\/local/usr/" Makefile
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install --owner root --group root --mode 755 -D disasm ${pkgdir}/usr/bin/disasm
    install --owner root --group root --mode 755 -D snescom ${pkgdir}/usr/bin/snescom
    install --owner root --group root --mode 755 -D sneslink ${pkgdir}/usr/bin/sneslink
}
