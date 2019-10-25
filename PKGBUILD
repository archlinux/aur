# Maintainer: Leonardo Gates <leogatesx9r@protonmail.com>

pkgname=realtek-firmware
_commit=2b016afc348ba4b5fb2016ffcb2822f4a293da0c
pkgver=20191022.2b016af
pkgrel=1
pkgdesc="Realtek-specific firmware for WiFI, Bluetooth and Ethernet cards"
makedepends=('git')
arch=('any')
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git#commit=${_commit}?signed")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/linux-firmware"

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

package() {
    conflicts=('linux-firmware'
               'linux-firmware-git'
               'kernel26-firmware'
               'ar9170-fw'
               'iwlwifi-1000-ucode'
               'iwlwifi-3945-ucode'
               'iwlwifi-4965-ucode'
               'iwlwifi-5000-ucode'
               'iwlwifi-5150-ucode'
               'iwlwifi-6000-ucode'
               'rt2870usb-fw'
               'rt2x00-rt61-fw'
               'rt2x00-rt71w-fw')
  replaces=('kernel26-firmware'
            'ar9170-fw'
            'iwlwifi-1000-ucode'
            'iwlwifi-3945-ucode'
            'iwlwifi-4965-ucode'
            'iwlwifi-5000-ucode'
            'iwlwifi-5150-ucode'
            'iwlwifi-6000-ucode'
            'rt2870usb-fw'
            'rt2x00-rt61-fw'
            'rt2x00-rt71w-fw')

    cd "${srcdir}/linux-firmware"

    install -d -m755 "${pkgdir}/usr/lib/firmware/"
    install -d -m755 "${pkgdir}/usr/share/licenses/linux-firmware/"

    find . -maxdepth 1 -iname "*rtl*" -type d -print0 | xargs -0 -I{} cp -a {} "${pkgdir}/usr/lib/firmware/"
    install -Dm644 LICEN*.rtl* "${pkgdir}/usr/share/licenses/linux-firmware/"
}
