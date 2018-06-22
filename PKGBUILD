# Maintainer: Lukas Wingerberg <h@xx0r.eu>

pkgname=repetier-server
pkgver=0.90.0
pkgrel=4
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
sha256sums=('451696abaee63d161fa20fee61a7a8d779f09873cdaf2e25a300309760313945'
            'c187ca73e8fc397625ddec0549478ac1921abc868d56156a032b39ca208b2be3')
sha256sums_i686=('92c2df515c7dec533b9175776516ac7539a9d95c439f15dea7ef40951e8e11d6')
sha256sums_x86_64=('2d967abb78c68478150af17289cdc72370af0565ddf457778076a66cddf2badf')
sha256sums_armv7h=('9732e673bb7945279908d2361b1251fe70458c7a2b2629ea9578c969b0576cd7')

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

