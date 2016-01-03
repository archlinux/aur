# Maintainer: Ivan Agarkov <ivan.agarkov@gmail.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=mt7610u_wifi_sta
pkgver=4606187
pkgrel=1
# To get an overview of witch WiFi dongle has this chipset refer to https://wikidevi.com/wiki/MediaTek_MT7610U
pkgdesc="Kernel module for MediaTek MT7610U chipset featured in TP-Link Archer T2U and T2UH, TP-Link TL-WDN5200, ASUS USB-AC50, ASUS USB-AC51, Comcast Xfinity KXW02AAA, D-Link DWA-171 rev B1 and more"
arch=('any')
license=('GPL2')
url="https://github.com/Myria-de/mt7610u_wifi_sta_v3002_dpo_20130916"
depends=('linux')
makedepends=('git' 'linux-headers')
install="depmod.install"
source=("mt7610u_wifi_sta"::"git+https://github.com/Myria-de/mt7610u_wifi_sta_v3002_dpo_20130916.git")
md5sums=('SKIP')

build() {
	make -C "${srcdir}/${pkgname}"
}

package() {
	cd "${srcdir}/${pkgname}"

	install -D -m 644 RT2870STA.dat "${pkgdir}/etc/Wireless/RT2870STA/RT2870STA.dat"
	install -D -m 644 os/linux/mt7650u_sta.ko "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/os/linux/mt7650u_sta.ko"
}
