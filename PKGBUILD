# Maintainer: Lukas Wingerberg <h@xx0r.eu>

pkgname=repetier-server
pkgver=0.86.2
pkgrel=3
pkgdesc='repetier server component'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.repetier-server.com/'
license=('custom')
depends=('systemd')
provides=('repetier-server')
conflicts=('repetier-host')
install=${pkgname}.install
source=('RepetierServer.xml'
        'RepetierServer.service')
source_i686=("http://download.repetier.com/files/server/debian-intel32/Repetier-Server-${pkgver}-Linux.deb")
source_x86_64=("http://download.repetier.com/files/server/debian-amd64/Repetier-Server-${pkgver}-Linux.deb")
source_armv7h=("http://download.repetier.com/files/server/debian-armhf/Repetier-Server-${pkgver}-Linux.deb")
sha256sums=('39c9beb8da7039cc30f244cf68cf3935f740200f0a52ae7d13c0b73107691fe8'
            '6d43a743737fa8aaaf73fa81d4b04c3e593b96137b160e37724b9e410fd9ee7c')
sha256sums_i686=('40f918f7a6ad0acb2917fd1fe1c66d5ff4bb1a76b5c1b6b2e88d1f1c70baf22e')
sha256sums_x86_64=('bceb56fab73fa200075fa0fcdc9314455f100f2dbba5a644e7af414e1873906e')
sha256sums_armv7h=('9dae5a58bbed515bb0ffd623a6c9510c82fe1bfce5f99fcf000415dd4bade21d')

package() {
  cd ${srcdir}
  bsdtar -xf data.tar.gz -C "$pkgdir"
  install -dm 755 "${pkgdir}"/usr/local/Repetier-Server
  mkdir "${pkgdir}"/opt/RepetierServer -p
  mkdir "${pkgdir}"/usr/lib/systemd/system/ -p
  mv "${pkgdir}"/usr/local/Repetier-Server/{bin,debian,etc,firmware,languages,modules,www} "${pkgdir}"/opt/RepetierServer
  rm -r "${pkgdir}"/etc/ "${pkgdir}"/lib/ "${pkgdir}"/usr/local/
  install -m 644 RepetierServer.service "${pkgdir}"/usr/lib/systemd/system/
  install -m 644 RepetierServer.xml "${pkgdir}"/opt/RepetierServer/etc/
}

