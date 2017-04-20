# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-beta
pkgver=5.6.3
_pkgver=bed25ecf6c
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
sha512sums=('d4eef5ccc275af06525203713446975d61637761d5391396ba336945c71a2e508ad547867c6aae1020a9ccfc37b31b5aef5d80abd4b7e1ef06f8fe3e03da15a5'
            'eb6625d99634dee0298a961aaead6e3c504f2bf1c502ff071c52e46e8c0817e169ff2020d2e7bda9bac0f170c5214ec6939b14c16c6c6ce8da75ac6930ca2a47')

package() {
  install -d "${pkgdir}/opt"
  cp -ar UniFi "${pkgdir}/opt/unifi"
  chown -R 113:113 "${pkgdir}/opt/unifi"
  rm "${pkgdir}/opt/unifi/readme.txt"
  install -D -m 644 unifi.service "${pkgdir}/usr/lib/systemd/system/unifi.service"
}
