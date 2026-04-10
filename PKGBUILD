# Maintainer: Davius <xdavius@gmail.com>

_pkgsubn='aic8800d80'
pkgname='aic8800d80-wifi-bt-git-dkms'
conflicts=('aic8800d80')
pkgver='1.0.0'
pkgrel='6'

pkgdesc="Kernel modules for AIC8800D80 USB dongle WIFI AX900 with BT5.4"
arch=('any')
makedepends=("git")
depends=("dkms")
url="https://github.com/shenmintao/aic8800d80"
license=('GPL-2.0-only')

source=(
  'git+https://github.com/shenmintao/aic8800d80.git#branch=bluetooth'
)
sha512sums=(
  'SKIP'
)

build() {
  cd "${srcdir}"
}

package() {
  # Copy udev rules
  install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
  install -m 644 "${srcdir}/${_pkgsubn}/aic.rules" "${pkgdir}/usr/lib/udev/rules.d/"

  # Copy device firmware
  install -dm 755 "${pkgdir}/usr/lib/firmware"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgsubn}/fw/aic8800D80" "${pkgdir}/usr/lib/firmware"

  # Copy source and dkms config
  install -dm 755 "${pkgdir}/usr/src/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgsubn}" "${pkgdir}/usr/src/aic8800-${pkgver}"

  # Remove git stuff
  rm -fr "${pkgdir}/usr/src/aic8800-1.0.0/.git"
}
