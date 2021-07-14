# Maintainer: Banned Patriot <realbannedpatriot@protonmail.com>
# Based on the PKGBUILD created by Yannick Inizan <inizan[dot]yannick[at]gmail[dot]com>, derived from Ivan Agarkov <ivan[dot]agarkov[at]gmail[dot]com>
basename=mt7610u_wifi_sta
pkgname=mt7610u_wifi_sta-git
pkgver=16f4781
pkgrel=1
# To get an overview of witch WiFi dongle has this chipset refer to https://wikidevi.com/wiki/MediaTek_MT7610U
pkgdesc="Kernel module for MediaTek MT7610U chipset featured in TP-Link Archer T2U and T2UH, TP-Link TL-WDN5200, ASUS USB-AC50, ASUS USB-AC51, Comcast Xfinity KXW02AAA, D-Link DWA-171 rev B1 and more"
arch=('any')
license=('GPL2')
url="https://github.com/BannedPatriot/mt7610u_wifi_sta.git"
conflicts=('mt7610u_wifi_sta')
replaces=('mt7610u_wifi_sta')
depends=('linux')
makedepends=('git' 'linux-headers')
install="depmod.install"
source=("git+https://github.com/BannedPatriot/mt7610u_wifi_sta.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${basename}"
  git describe --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${basename}"
  make -C "${srcdir}/${basename}"
}

package() {
  cd "${srcdir}/${basename}"
  mkdir -p "${pkgdir}/etc/Wireless/RT2870STA"
  mkdir -p "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/os/linux"
  install -m 644 -t "${pkgdir}/etc/Wireless/RT2870STA" RT2870STA.dat
  install -m 644 -t "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/os/linux" os/linux/*.ko
}
