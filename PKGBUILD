# Maintainer: Lukas Wingerberg <h@xx0r.eu>

pkgname=repetier-server
pkgver=0.94.3
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
sha256sums_i686=('5408d9511aa33364ca3043c5e564edfe506ff3bb8ef8e689801ec50fec921992')
sha256sums_x86_64=('f0b01eec9bec0bf8e1ff58248a8a70ea31264acf4383fa8167b0eeb6820edc78')
sha256sums_armv7h=('9820c062111246f65df047f9fcdb36e78e8c8707953f841bfd7c83f7317bc41a')
sha256sums_aarch64=('4c6a33e4f98f203af122ab7717c7582a1ea1416412fa6b520a43268d4573ef20')

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

