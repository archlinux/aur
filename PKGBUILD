# Maintainer linuxer <linuxer@artixlinux.org>
# Maintainer: Leonardo Gates <leogatesx9r@protonmail.com>

pkgname=i915-firmware
pkgver=20210208
pkgrel=2
pkgdesc="Intel's integrated GPU firmware"
arch=('any')
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>
source=("https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${pkgver}.tar.gz"
        "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${pkgver}.tar.asc")
b2sums=('2f45371b8118c3ee98073a580f45f4c739c84ff4280ae5add6f633c5c61d4782f27eb320150368ac9901aa71595d4546dbb54141309ab1eaa2ee4f9f31c4dbc8'
        '627bbdb2a62d01da989f9784b8523b1ed4a2c83ca7ad09644cd76b98a7e135c4dacfc939c00bfd8f2393eb134ef2ca9cbda15f9a6b5bbd8f27b63842108a50c7')

package() {
    #conflicts=('linux-firmware'
    #           'linux-firmware-git')

    cd "${srcdir}/linux-firmware-${pkgver}"

    install -d -m755 "${pkgdir}/usr/lib/firmware/"
    install -d -m755 "${pkgdir}/usr/share/licenses/linux-firmware/"

    find . -maxdepth 1 -iname "*i915*" -type d -print0 | xargs -0 -I{} cp -a {} "${pkgdir}/usr/lib/firmware/"
    install -Dm644 LICEN*.i915 "${pkgdir}/usr/share/licenses/linux-firmware/"
}
