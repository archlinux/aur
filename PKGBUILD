# Maintainer: FT <worldoptimizer@gmail.com>
pkgname=acp6x-omen-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Patched AMD Yellow Carp Audio Driver for HP OMEN 16 (Fixes Board ID 15E2 Rev 62 AMD Microphone Array)"
arch=('x86_64')
url="https://github.com/nevetscar/acp6x-omen-dkms"
license=('GPL')
depends=('dkms' 'linux-headers')
conflicts=('acp6x-omen-dkms-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('881bd6833d8b0d909551e23196a3b8450e607c5b47ab5ee88abc62edcfd73033')

package() {
    cd "${pkgname}-${pkgver}"

    # 1. Install Source Code for DKMS
    install -d "${pkgdir}/usr/src/acp6x-omen-${pkgver}"
    cp -t "${pkgdir}/usr/src/acp6x-omen-${pkgver}/" \
        dkms.conf Makefile pci-acp6x.c acp6x-mach.c acp6x.h acp6x_chip_offset_byte.h

    # 2. Install Blacklist Configuration
    install -d "${pkgdir}/etc/modprobe.d"
    install -m 644 blacklist-acp6x-omen.conf "${pkgdir}/etc/modprobe.d/blacklist-acp6x-omen.conf"
}
