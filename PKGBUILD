# Maintainer: Yannick Inizan <inizan[dot]yannick[at]gmail[dot]com>
# Based on the PKGBUILD created by Ivan Agarkov <ivan[dot]agarkov[at]gmail[dot]com>

pkgname=mt7610u_wifi_sta-alt
pkgver=3
pkgrel=3
# To get an overview of witch WiFi dongle has this chipset refer to https://wikidevi.com/wiki/MediaTek_MT7610U
pkgdesc="Kernel module for MediaTek MT7610U chipset featured in TP-Link Archer T2U and T2UH, TP-Link TL-WDN5200, ASUS USB-AC50, ASUS USB-AC51, Comcast Xfinity KXW02AAA, D-Link DWA-171 rev B1 and more"
arch=('any')
license=('GPL2')
url="https://gitlab.com/BZHDeveloper/mt7610u_wifi_sta_v3002_dpo_20130916"
conflicts=('mt7610u_wifi_sta')
replaces=('mt7610u_wifi_sta')
depends=('linux')
makedepends=('git' 'linux-headers')
install="depmod.install"
source=("mt7610u_wifi_sta-alt"::"git+https://gitlab.com/BZHDeveloper/mt7610u_wifi_sta_v3002_dpo_20130916.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make -C "${srcdir}/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/etc/Wireless/RT2870STA"
  mkdir -p "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/os/linux"
  install -m 644 -t "${pkgdir}/etc/Wireless/RT2870STA" RT2870STA.dat
  install -m 644 -t "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/os/linux" os/linux/*.ko
}
