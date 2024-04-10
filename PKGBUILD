# Maintainer: Jonas Leder <info@jonasled.de>

pkgname=repetier-server
pkgver=1.4.16
pkgrel=2
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
sha256sums_i686=('50a93c9b6d4d7958459f52173f3aefe01447f01310603c362ba698d733083769')
sha256sums_x86_64=('aec229bcae1f86045d3e4384752fa3824597ebca4d7b4d5c6129c47f0d84b905')
sha256sums_armv7h=('5e36b5fd9554567156275f184ac7e6da2470195815f24bd990bda8b5a49dcd75')
sha256sums_aarch64=('bb789029cb95c8f9837038771df00e19a24fbc3a3e0a0d993715fc84f695e3b1')

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
