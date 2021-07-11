# Maintainer: Lukas Wingerberg <h@xx0r.eu>

pkgname=repetier-server
pkgver=1.0.4
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
sha256sums_i686=('21a629f1ddf693e73d5b9ac85e734b872f0e2c26acc7a4c2bf64274564a59eb8')
sha256sums_x86_64=('3c4554901510b0f41daf338bf9a36709be8ab3f7cbca816c8653b5957dd0542c')
sha256sums_armv7h=('db146fd8d61ccfa5221df99b44275aad6d883154faa7d2960112c5352d008726')
sha256sums_aarch64=('63d9263393d5db703e616ac3fd4c3924d0e23a4bab1de4fcb12707b6690baf47')

package() {
  cd ${srcdir}
  bsdtar -xf data.tar.gz -C "$pkgdir"
  install -dm 755 "${pkgdir}"/usr/local/Repetier-Server
  install -dm 755 "${pkgdir}"/lib
  mkdir -p "${pkgdir}"/opt/RepetierServer
  mv "${pkgdir}"/usr/local/Repetier-Server/{bin,debian,extra,etc,firmware,licenses,languages,modules,www} "${pkgdir}"/opt/RepetierServer
  mv "${pkgdir}"/lib/systemd/system/RepetierServer.service "${pkgdir}"/opt/RepetierServer
  rm -r "${pkgdir}"/etc/ "${pkgdir}"/lib/ "${pkgdir}"/usr/
}

