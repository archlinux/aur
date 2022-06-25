# Maintainer linuxer <linuxer@artixlinux.org>
# Maintainer: Leonardo Gates <leogatesx9r@protonmail.com>

pkgname=i915-firmware
pkgver=20220209
pkgrel=1
pkgdesc="Intel's integrated GPU firmware"
arch=('any')
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>
source=("https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${pkgver}.tar.gz"
        "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${pkgver}.tar.asc")
b2sums=('16be12197c83843b27f7e1126d5576101bee9e126806176a65e0ed95b41ebd69bfec0ebf89ede4f9298fb82cfb1ce33187894f0480c8c3a44e61f62185cbabf8'
        '6f322bb9fb54384567845ebc9a988d84e89d41f19385eaf62670883fce0d6b5d5b96115e8fe3e872d3706399e90ff3c332a27111968a1168cc18cc058687e4b9')

package() {
    #conflicts=('linux-firmware'
    #           'linux-firmware-git')

    cd "${srcdir}/linux-firmware-${pkgver}"

    install -d -m755 "${pkgdir}/usr/lib/firmware/"
    install -d -m755 "${pkgdir}/usr/share/licenses/linux-firmware/"

    find . -maxdepth 1 -iname "*i915*" -type d -print0 | xargs -0 -I{} cp -a {} "${pkgdir}/usr/lib/firmware/"
    install -Dm644 LICEN*.i915 "${pkgdir}/usr/share/licenses/linux-firmware/"
}
