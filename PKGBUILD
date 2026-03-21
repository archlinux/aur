# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=asmsx
pkgver=1.2.0
pkgrel=1
_pkgname=asMSX-${pkgver}
pkgdesc="Z80 cross-assembler for MSX"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://www.msx.org/wiki/AsMSX"
license=('GPL3')
makedepends=('bison' 'flex' 'make' 'gcc')
source=("${_pkgname}.tar.gz::https://github.com/Fubukimaru/asMSX/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7480afd17816dd86c9eafebb3d71e4167d7c669563bc27074577fd33a5908ce4')

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
