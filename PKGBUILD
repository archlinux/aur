# Maintainer: Jonas Leder <info@jonasled.de>

pkgname=repetier-server
pkgver=1.4.17
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
sha256sums_i686=('4d4027055c57ceeec223d524ca28ee0cf7edb6c9afdebee5caa837485d53d850')
sha256sums_x86_64=('bc157ffc935086a3c543dcd177b30a3b2d1ef507b114df22a4b95f07ee9f71bb')
sha256sums_armv7h=('a0ca4c24752c2740e07a269d2c7f71c4baf4c066a82171596bbf53b6b1dd8f05')
sha256sums_aarch64=('95fb9abe9f02a8c74b8a86fb104d2db97c26b8df519283824c46f1bc1db012d5')

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
