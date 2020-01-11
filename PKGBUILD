# Maintainer: ccat3z <c0ldcat3z@gmail.com>

_kernver_base=5.1.4
_pkgbase=btintel-default-address
pkgname=${_pkgbase}-dkms
url=https://github.com/c0ldcat
pkgver=${_kernver_base}
pkgrel=2
pkgdesc="Allow default address when setup intel bluetooth device"
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux-headers' 'dkms')
source=("Makefile"
        "dkms.conf"
        "btintel.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btintel.c?id=refs/tags/v${_kernver_base}"
        "btusb.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btusb.c?id=refs/tags/v${_kernver_base}"
        "btbcm.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btbcm.h?id=refs/tags/v${_kernver_base}"
        "btintel.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btintel.h?id=refs/tags/v${_kernver_base}"
        "btrtl.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btrtl.h?id=refs/tags/v${_kernver_base}")
	
build() {
    cd "${srcdir}"
    sed -i '/^\s*set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);\s*$/d' *.c
}

package() {
    install -Dm644 Makefile "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile"
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
    install -Dm644 btintel.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/btintel.c"
    install -Dm644 btusb.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/btusb.c"
    install -Dm644 btbcm.h "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/btbcm.h"
    install -Dm644 btintel.h "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/btintel.h"
    install -Dm644 btrtl.h "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/btrtl.h"

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

md5sums=("d4023861ba05ecb47380354511ac798f"
         "aa80ec82a8d5d8cc4a39bc21930e8519"
         "5263f3baa5ef312a6ee6f3923f9ee78f"
         "e2edece3942c8a69bbc131a632e9b880"
         "f7a3ed12a2b7540186a0547865533420"
         "e4b14fff2acadf13a33cc3bc2c08c949"
         "25301b23397463669195bf659bc4e0f8")
