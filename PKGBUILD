# Maintainer: Jonas Leder <info@jonasled.de>

pkgname=repetier-server
pkgver=1.4.2
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
sha256sums_i686=('5c7fd4e56af818be6f072c6e5f142c515c57de2b5f9857442b375aa5be91b0c7')
sha256sums_x86_64=('da2135954913bcf54cc14a35841fa888a310440c2cecf48d0d9c89d32e6c9a22')
sha256sums_armv7h=('e8bb7244075c07a6693db790fe43adb881d3667eaad8a65f287b7a4d0a975bac')
sha256sums_aarch64=('d3dedcf77e764120b95f7ae1989f82abef78ad0f8bc304154bbcc1bfdb3fa796')

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
