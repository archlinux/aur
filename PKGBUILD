# Maintainer linuxer <linuxer@artixlinux.org>
# Maintainer: Leonardo Gates <leogatesx9r@protonmail.com>

pkgname=i915-firmware
pkgver=20201022
pkgrel=1
pkgdesc="Intel's integrated GPU firmware"
arch=('any')
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>
source=("https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${pkgver}.tar.gz"
        "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${pkgver}.tar.asc")
b2sums=('d8a23a024975d4515da262b4697f91002b59cc8424f9dfea227faae1c70bf78ded8c50843ec8b2cf1891db8be268050c4c8eaac7627458014dfe6b55db8a64a7'
        '3c92a8537f794882b607b8e77fd131b20a44ef76dc4d6a390f730b512043cf222cc0756863f4f006fc77e41d3e17a57592b7b8cc341030994d265d3d64fc7a1c')

package() {
    conflicts=('linux-firmware'
               'linux-firmware-git')

    cd "${srcdir}/linux-firmware-${pkgver}"

    install -d -m755 "${pkgdir}/usr/lib/firmware/"
    install -d -m755 "${pkgdir}/usr/share/licenses/linux-firmware/"

    find . -maxdepth 1 -iname "*i915*" -type d -print0 | xargs -0 -I{} cp -a {} "${pkgdir}/usr/lib/firmware/"
    install -Dm644 LICEN*.i915 "${pkgdir}/usr/share/licenses/linux-firmware/"
}
