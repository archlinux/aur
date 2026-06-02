# Maintainer: Yichuan Gao <aur@gycis.me>

pkgname=hpmicro-openocd-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="HPMicro-patched OpenOCD (hpm_xpi) with HPM flash algorithms"
arch=('x86_64')
url="https://github.com/hpmicro/riscv-openocd"
license=('GPL-2.0-or-later')
depends=('libusb' 'hidapi' 'libftdi')
provides=('hpmicro-openocd')
conflicts=('hpmicro-openocd')
# Prebuilt binaries: keep them as shipped.
options=('!strip' '!debug')
_prefix="/opt/hpmicro/openocd"
source=("openocd-linux-${CARCH}-${pkgver}.tar.gz::${url}/releases/download/hpm_xpi_v${pkgver}/openocd-linux-${CARCH}.tar.gz"
        '60-hpmicro-openocd.rules')
sha256sums=('dab7629a4de59a9c05f8d6c0db0ad4e900006f761efc20377946a420aae11566'
            '9e364726be707d6e9f863bd69aeba606587b767086bbc6ca07a911e9e1291cfe')

package() {
    # Upstream tarball is laid out as usr/local/{bin,share}.
    install -d "${pkgdir}${_prefix}"
    cp -a "${srcdir}/usr/local/bin" "${pkgdir}${_prefix}/"
    cp -a "${srcdir}/usr/local/share" "${pkgdir}${_prefix}/"

    install -Dm644 "${srcdir}/60-hpmicro-openocd.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/60-hpmicro-openocd.rules"
}
