# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-beta
pkgver=5.6.7
_pkgver=63ab9a7965
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
sha512sums=('c9ea3fd8f5f547cebbb12a005fdb27f89555f38e0ecc2263212295d121c52262435af7dcc7b7bf4d8f95a2dca132e24668a37af8b5bb8d53cc35bf51209396da'
            'eb6625d99634dee0298a961aaead6e3c504f2bf1c502ff071c52e46e8c0817e169ff2020d2e7bda9bac0f170c5214ec6939b14c16c6c6ce8da75ac6930ca2a47')

package() {
  install -d "${pkgdir}/opt"
  cp -ar UniFi "${pkgdir}/opt/unifi"
  chown -R 113:113 "${pkgdir}/opt/unifi"
  rm "${pkgdir}/opt/unifi/readme.txt"
  install -D -m 644 unifi.service "${pkgdir}/usr/lib/systemd/system/unifi.service"
}
