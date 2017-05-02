# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-beta
pkgver=5.6.4
_pkgver=c3f780a99
pkgrel=1
pkgdesc='Controller for Ubiquiti UniFi accesspoints'
arch=('any')
url='http://www.ubnt.com/'
license=('custom')
depends=('mongodb' 'java-runtime')
provides=('unifi')
conflicts=('unifi' 'unifi-controller-beta')
replaces=('unifi-controller-beta')
backup=('opt/unifi/data/system.properties')
install=unifi.install
source=(${pkgname}-${pkgver}.zip::https://www.ubnt.com/downloads/unifi/${pkgver}-${_pkgver}/UniFi.unix.zip
        unifi.service)
sha512sums=('69b84d16350b7018e2ef14173cde15552e421c659f93e000c6c6e7b0dba5c2f8b9bf230f289624678f039e122fa45a9b38022434cb0e616c78a437c2ba977702'
            'eb6625d99634dee0298a961aaead6e3c504f2bf1c502ff071c52e46e8c0817e169ff2020d2e7bda9bac0f170c5214ec6939b14c16c6c6ce8da75ac6930ca2a47')

package() {
  install -d "${pkgdir}/opt"
  cp -ar UniFi "${pkgdir}/opt/unifi"
  chown -R 113:113 "${pkgdir}/opt/unifi"
  rm "${pkgdir}/opt/unifi/readme.txt"
  install -D -m 644 unifi.service "${pkgdir}/usr/lib/systemd/system/unifi.service"
}
