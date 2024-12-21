# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=asmsx
pkgver=1.1.1
pkgrel=1
_pkgname=asMSX-${pkgver}
pkgdesc="Z80 cross-assembler for MSX"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://www.msx.org/wiki/AsMSX"
license=('GPL3')
makedepends=('bison' 'flex' 'make' 'gcc')
source=("${_pkgname}.tar.gz::https://github.com/Fubukimaru/asMSX/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('46d2d2c0c5234be3e6f66aaa2768640c10ca3b3e5a7d148236cc3e28d773d8e7')

build() {
    cd ${_pkgname}
    make
}

package() {
    cd ${_pkgname}
### don't use it, incomplete and conflict
#    make DESTDIR=$pkgdir PREFIX=/usr install
    install -Dm755 asmsx ${pkgdir}/usr/bin/asmsx
    install -Dm644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    for file in asmsx.md  asmsx.png  coding-style.md  legacy-spanish-manual.doc  testing.md
    do
      install -Dm644 doc/${file} -t "${pkgdir}"/usr/share/doc/${pkgname}/
    done
    cp -a code "${pkgdir}"/usr/share/doc/${pkgname}/
}
