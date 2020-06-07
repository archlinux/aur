# Maintainer: Jouni Rinne <l33tmmx at gmail dot com>
# Contributor: Edmunt Pienkowsky <roed@onet.eu>

pkgname=alarm-bluetooth-raspberrypi
pkgver=6
pkgrel=3
pkgdesc="Bluetooth support for Raspberry Pi"
conflicts=('pi-bluetooth')
arch=('any')
license=('GPL')
url="https://github.com/RoEdAl/alarm-bluetooth-raspberrypi"
depends=('firmware-raspberrypi>=4')
makedepends=('dtc')
options=('!strip')
install=$pkgname.install
source=('bcmbt-overlay.dts'
        'alarm-bluetooth-raspberrypi.install')
sha256sums=('0ba43da86a934558eb8659daecc29186ccfc5864eca5b03c06afd7f62de954ae'
            '0dc3e5e8b966d122aa95bf6455360fd9a6efd3439e40f11bfe842282a12eb665')

build() {
    dtc -I dts -O dtb bcmbt-overlay.dts -o bcmbt.dtbo
}

package() {
    install -d ${pkgdir}/usr/lib/firmware/updates/brcm
    install -d ${pkgdir}/boot/overlays
    install -m 0644 ${srcdir}/bcmbt.dtbo ${pkgdir}/boot/overlays/bcmbt.dtbo

    # workaround for Raspberry Pi 3B+
    ln -s BCM4345C0.hcd ${pkgdir}/usr/lib/firmware/updates/brcm/BCM.hcd
}
