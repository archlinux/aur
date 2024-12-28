# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=z26
pkgver=4.07
_pkgver=${pkgver//.}
pkgrel=2
pkgdesc="An Atari 2600 Emulator"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://whimsey.com/z26/"
# implicit has it based on fake6502 https://github.com/omarandlorraine/fake6502
license=('GPL2')
depends=('sdl2')
makedepends=('make' 'clang')
source=("https://whimsey.com/z26/${pkgname}_${_pkgver}_src.zip"
        "https://whimsey.com/z26/z26_license.html"
	'z26.desktop')
sha256sums=('2764ee92abf95c0a71592f08a14e7e30b913cbb9247d88e7087162dac24d9367'
	    'b8c983520e7613800a7f5ed19f8e73982a53e4e63ecde1f5808f957a2089575a'
            'd4c7354662219ce7497bd276bca335af3499eed500a7805f4b19157af3528efe')

build() {
    cd ${pkgname}_${_pkgver}_src
    make
}

package() {
    install -Dm644 z26_license.html -t ${pkgdir}/usr/share/licenses/${pkgname}/
    install -Dm644 z26.desktop -t ${pkgdir}/usr/share/applications/
    cd ${pkgname}_${_pkgver}_src
    install -Dm755 z26 -t ${pkgdir}/usr/bin/
    install -Dm644 z26icon.png ${pkgdir}/usr/share/icons/default/32x32/apps/z26icon.png
}
