# Maintainer: Alex Amadori <tacchinotacchi@gmail.com>

pkgname=rtbth-dkms
pkgver=3.9.4
pkgrel=2
pkgdesc="rtbth Kernel module sources for Ralink RT3290 bluetooth"
arch=('i686' 'x86_64')
url='http://www.mediatek.com/'
license=('mixed') # I haven't been able to discover where this driver popped out from, I 
# haven't found it in the official MediaTek website
# i assumed it was GPL all driver's for linux i found on the Mediatek website were GPL
depends=('dkms')
optdepends=('bluez: Canonical implementation of bluetooth protocol'
'bluez-utils: Utilities for Bluez')
provides=('rtbth')
install='rtbth-dkms.install'
source=("https://github.com/f1u77y/rtbth-dkms-aur/archive/${pkgver}.tar.gz")
sha256sums=('511792b08e2b7386a45e1942014d2ea7d01be48144ba154a45d33484f198eda1')

prepare() {
  cd ${srcdir} 
  tar -xf "${pkgver}".tar.gz
  cd "${pkgname}-aur-${pkgver}" 
}

package() {
  cd "${srcdir}/${pkgname}-aur-${pkgver}"
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/src
  mkdir -p "${pkgdir}"/etc/modprobe.d/
  cp -r ./ "${pkgdir}/usr/src/rtbth-${pkgver}"
  cp  tools/rtbt "${pkgdir}"/usr/bin/rtbt
  cp  tools/ralink-bt.conf "${pkgdir}"/etc/modprobe.d/ralink-bt.conf 
}

