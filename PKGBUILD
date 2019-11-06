# Maintainer: Leonardo Gates <leogatesx9r@protonmail.com>

pkgname=realtek-firmware
pkgver=20191022
pkgrel=1
pkgdesc="Realtek-specific firmware for WiFI, Bluetooth and Ethernet cards"
arch=('any')
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>
source=("https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${pkgver}.tar.gz"
        "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${pkgver}.tar.asc")
sha1sums=('a1d5004d013db94cf3779a8b268858a93b585ed4'
          'SKIP')

package() {
    conflicts=('linux-firmware'
               'linux-firmware-git')

    cd "${srcdir}/linux-firmware-${pkgver}"

    install -d -m755 "${pkgdir}/usr/lib/firmware/"
    install -d -m755 "${pkgdir}/usr/share/licenses/linux-firmware/"

    find . -maxdepth 1 -iname "*rtl*" -type d -print0 | xargs -0 -I{} cp -a {} "${pkgdir}/usr/lib/firmware/"
    install -Dm644 LICEN*.rtl* "${pkgdir}/usr/share/licenses/linux-firmware/"
}
