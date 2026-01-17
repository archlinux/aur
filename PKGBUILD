# Maintainer: Utkan Güngördü <utkan@freeconsole.org>
#
# More info: https://www.reddit.com/r/linuxaudio/comments/11i7qf6/call_for_beta_testing_emu10k1_driver_improvements/
# emu_das=1 option is enabled by default
pkgname=emu10k1-ossis-dkms
_pkgname=emu10k1-ossis
pkgver=6.13
pkgrel=1
pkgdesc="Creative emu10k1 driver with new features and bug fixes from ossilator"
arch=('any')
url="https://github.com/ossilator/linux"
license=('GPL2')
depends=('dkms' 'linux-headers')
source=("git+https://github.com/ossilator/linux.git#branch=ossis-emu10k1-6.13"
        "dkms.conf"
        "emu10k1.conf"
        "Makefile"
        "emumixer.c")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {


  local _srcdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  install -d "${_srcdir}"

  cp -r "${srcdir}/linux/sound/pci/emu10k1/"* "${_srcdir}/"
  cp "${srcdir}/linux/include/sound/emu10k1.h" "${_srcdir}/"
  cp "${srcdir}/emumixer.c"  "${_srcdir}/"
  cp "${srcdir}/Makefile" "${_srcdir}/Makefile"

  install -m644 "${srcdir}/dkms.conf" "${_srcdir}/dkms.conf"
  install -Dm644 "${srcdir}/emu10k1.conf" "${pkgdir}/usr/lib/modprobe.d/emu10k1.conf"
}
