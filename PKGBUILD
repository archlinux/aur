# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=rtl8723bs-bluetooth-firmware-git
pkgver=r12.09eb91f
pkgrel=4
pkgdesc='Bluetooth Firmware for RTL8723bs'
arch=('any')
url="https://github.com/lwfinger/rtl8723bs_bt"
license=('custom')
makedepends=('git')
source=("git+https://github.com/lwfinger/rtl8723bs_bt.git")
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/rtl8723bs_bt
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
 cd "${srcdir}/rtl8723bs_bt"
 install -Dm 644 ./rtlbt_fw "${pkgdir}/usr/lib/firmware/rtl_bt/rtl8723bs_fw.bin"
 install -Dm 644 ./rtlbt_config "${pkgdir}/usr/lib/firmware/rtl_bt/rtl8723bs_config-OBDA8723.bin"
}
