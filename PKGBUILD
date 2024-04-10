# Maintainer: Jack <DevJackMC@gmail.com>


pkgname=hyperx-cloud-ii-wireless-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='HyperX Cloud II Battery and Mute Monitoring (BIN version)'
arch=('x86_64')
url='https://github.com/LennardKittner/HyperXCloudIIWireless'
license=('MIT')
depends=('dbus' 'libusb' 'hidapi')
provides=('hyperx-cloud-ii-wireless')
conflicts=('hyperx-cloud-ii-wireless')
#source=('git+https://github.com/LennardKittner/HyperXCloudIIWireless.git')

source=("HyperXCloudIIWireless.zip::https://github.com/LennardKittner/HyperXCloudIIWireless/releases/download/v${pkgver}/Linux.zip")
sha256sums=('SKIP')



build() {

  echo KERNEL=="hidraw*", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16c4", MODE="0666" >> 99-hyperx-cloud-II.rules
  echo KERNEL=="hidraw*", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1723", MODE="0666" >> 99-hyperx-cloud-II.rules

}

package() {

  install -Dm755 hyper_x_cloud_ii_wireless "${pkgdir}/usr/bin/cloud-ii-tray"
  install -Dm755 cli_app "${pkgdir}/usr/bin/cloud-ii-cli"


  
  install -Dm644 99-hyperx-cloud-II.rules "${pkgdir}/usr/lib/udev/rules.d/99-hyperx-cloud-II.rules"

}

