# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=asmsx
pkgver=1.1.0
pkgrel=1
_pkgname=asMSX-${pkgver}-RUN
pkgdesc="Z80 cross-assembler for MSX"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://www.msx.org/wiki/AsMSX"
license=('GPL3')
makedepends=('bison' 'flex' 'make' 'gcc')
source=("${_pkgname}.tar.gz::https://github.com/Fubukimaru/asMSX/archive/refs/tags/${pkgver}-RUN.tar.gz")
sha256sums=('155f8e16a245cd9cf7a669344209c3da41d9c6ca0bef25c5849f191497ad791c')

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
