# Maintainer: FT <worldoptimizer@gmail.com>
pkgname=acp6x-omen-dkms
pkgver=1.0
pkgrel=2
pkgdesc="Patched AMD Yellow Carp Audio Driver for HP OMEN 16 (Fixes Board ID 15E2 Rev 62 AMD Microphone Array)"
arch=('x86_64')
url="https://github.com/nevetscar/acp6x-omen-dkms"
license=('GPL')
depends=('dkms')
conflicts=('acp6x-omen-dkms-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7afc8803bef4c532fdf47aca3195e980d132834ade085a30530e5d518e423817')

package() {
    cd "${pkgname}-${pkgver}"

    # 1. Install Source Code for DKMS
    install -d "${pkgdir}/usr/src/acp6x-omen-${pkgver}"
    cp -t "${pkgdir}/usr/src/acp6x-omen-${pkgver}/" \
        dkms.conf Makefile pci-acp6x.c acp6x-mach.c acp6x.h acp6x_chip_offset_byte.h

    # 2. Install Blacklist Configuration
    install -d "${pkgdir}/etc/modprobe.d"
    install -m 644 blacklist-acp6x-omen.conf "${pkgdir}/etc/modprobe.d/blacklist-acp6x-omen.conf"

    # 3. Install License
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
