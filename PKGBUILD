# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=minicube64
pkgver=0.0.2.35BDA
pkgrel=3
pkgdesc=" a fantasy console style emulator based on 6502, with the intention of helping people learn how games were made for older systems"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://aeriform.gitbook.io/minicube64"
# implicit has it based on fake6502 and then contaminated https://github.com/omarandlorraine/fake6502
license=('GPL2')
depends=('sdl2')
makedepends=('make' 'gcc')
source=("https://github.com/aeriform-io/minicube64/archive/refs/tags/${pkgver}.tar.gz"
	"boot_bin.patch")
sha256sums=('1eabde96f76466ace4969e834e27ee2bd3c4d436d16356a4c58b1dc5c4cee5e0'
	    '9180486109053b5efe73cee84ca720d72498f200a8a928269bbf62db82a98624')

build() {
    cd ${pkgname}-${pkgver}
    patch -p1 <../boot_bin.patch
    make
}

package() {
#    install -Dm644 LICENSE.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
    cd ${pkgname}-${pkgver}
    install -Dm755 minicube -t ${pkgdir}/usr/bin/
    install -Dm755 tool/im2cube.py -t ${pkgdir}/usr/bin/
    install -Dm644 64cube.inc -t ${pkgdir}/usr/share/${pkgname}/
    install -Dm644 boot.bin -t ${pkgdir}/usr/share/${pkgname}/
    cp -a demos ${pkgdir}/usr/share/${pkgname}/
#    install -Dm644 LICENSE.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
#    install -Dm644 minicube.desktop -t ${pkgdir}/usr/share/applications/
#    install -Dm644 doc/minicube.png ${pkgdir}/usr/share/icons/default/64x64/apps/minicube.png
}
