# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-controller-beta
pkgver=5.0.4
_pkgver=11eabc05
pkgrel=1
pkgdesc='Controller for Ubiquiti UniFi accesspoints'
arch=('any')
url='http://www.ubnt.com/'
license=('custom')
depends=('mongodb' 'java-runtime')
provides=('unifi')
conflicts=('unifi')
backup=('opt/unifi/data/system.properties')
install=unifi.install
source=("https://www.ubnt.com/downloads/unifi/${pkgver}-${_pkgver}/UniFi.unix.zip"
        'unifi.service')
sha256sums=('9d34bf366bb2e11352b8eb7aec8e14b19aebb85d8ee655fd7b34331e74fdce35'
            'd4c16c5fc5eef58d00d0f176f081374197431a0ae7887224b3c107ac4c41bce6')

package() {
  install -d "$pkgdir/opt"
  cp -ar UniFi "$pkgdir/opt/unifi"
  chown -R 113:113 "$pkgdir/opt/unifi"
  rm "$pkgdir/opt/unifi/readme.txt"
  install -D -m 644 unifi.service "$pkgdir/usr/lib/systemd/system/unifi.service"
}
