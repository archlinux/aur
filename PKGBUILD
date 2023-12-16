# Maintainer: Jonas Leder <info@jonasled.de>

pkgname=repetier-server
pkgver=1.4.15
pkgrel=1
pkgdesc='repetier server component'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://www.repetier-server.com/'
license=('custom')
depends=('systemd' 'avahi')
makedepends=('binutils' 'fakeroot')
provides=('repetier-server')
conflicts=('repetier-host')
install=${pkgname}.install
source_i686=("http://download.repetier.com/files/server/debian-intel32/Repetier-Server-${pkgver}-Linux.deb")
source_x86_64=("http://download.repetier.com/files/server/debian-amd64/Repetier-Server-${pkgver}-Linux.deb")
source_armv7h=("http://download.repetier.com/files/server/debian-armhf/Repetier-Server-${pkgver}-Linux.deb")
source_aarch64=("http://download.repetier.com/files/server/debian-arm64hf/Repetier-Server-${pkgver}-Linux.deb")
sha256sums_i686=('728d94f312bc57549665cfb6b23fef1ea36c80ecc3490d8c4c8f7f41e0e483c7')
sha256sums_x86_64=('4ba62bb307f9de02acc51255f5a58d4ab064acfaefe6ae6752b822c68896f5c3')
sha256sums_armv7h=('c6ef2c420a59007449613a4183f2e182d1c837e5d902c8e9175efd7b12ecb842')
sha256sums_aarch64=('53b1bc9c5bb72d14b6a43ee9cf1dbec4b5d69a828d0d22b7f1c09509b44ef587')

package() {
  cd ${srcdir}
  bsdtar -xf data.tar.gz -C "$pkgdir"
  install -dm 755 "${pkgdir}"/usr/local/Repetier-Server
  install -dm 755 "${pkgdir}"/lib
  mkdir -p "${pkgdir}"/opt/RepetierServer
  mv "${pkgdir}"/usr/local/Repetier-Server/{bin,debian,extra,etc,firmware,licenses,languages,modules,www,wizards} "${pkgdir}"/opt/RepetierServer
  mv "${pkgdir}"/lib/systemd/system/RepetierServer.service "${pkgdir}"/opt/RepetierServer
  rm -r "${pkgdir}"/etc/ "${pkgdir}"/lib/ "${pkgdir}"/usr/
}
