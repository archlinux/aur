# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-beta
pkgver=5.7.10
_pkgver=581a7e9158
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
sha512sums=('e93cb6a82efac8ce77ca2a62df3c77113a9785e81d76dddb5cf4c19ee0485e368449999393c6730ab2d247bb6a41735994ba4235ba34819df555dddc71c1d0ff'
            'eb6625d99634dee0298a961aaead6e3c504f2bf1c502ff071c52e46e8c0817e169ff2020d2e7bda9bac0f170c5214ec6939b14c16c6c6ce8da75ac6930ca2a47')

package() {
  install -d "${pkgdir}/opt"
  cp -ar UniFi "${pkgdir}/opt/unifi"
  chown -R 113:113 "${pkgdir}/opt/unifi"
  rm "${pkgdir}/opt/unifi/readme.txt"
  install -D -m 644 unifi.service "${pkgdir}/usr/lib/systemd/system/unifi.service"
}
