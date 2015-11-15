# Maintainer: Ivan Agarkov <ivan.agarkov@gmail.com>
pkgname=mt7610u_wifi_sta
pkgrel=1
pkgver=('4606187')
pkgdesc="Modified usb wifi driver for TP-Link TL-WDN5200 AC600 T2U and Cisco Linksys AE6000 / AC580 on Linux"
arch=('i686' 'x86_64')
url="https://github.com/Myria-de/mt7610u_wifi_sta_v3002_dpo_20130916"
license=('GPL')
depends=('linux')
makedepends=('git' 'gcc' 'linux-headers' 'make' 'sed' 'grep')
source=('mt7610u_wifi_sta::git+https://github.com/Myria-de/mt7610u_wifi_sta_v3002_dpo_20130916.git')
md5sums=('SKIP')
install=('depmod.install')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
        install -d "$pkgdir/etc/Wireless/RT2870STA/"
        install -m 644 -c RT2870STA.dat "$pkgdir/etc/Wireless/RT2870STA/RT2870STA.dat"
        install -d "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/"
        install -m 644 -c os/linux/mt7650u_sta.ko "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/"
}
