# Maintainer: blacktemplar <blacktemplar@a1.net>
pkgname=('creeptd')
pkgver=1.1.1
pkgrel=1
pkgdesc="CreepTD is a multiplayer tower defense game"
arch=('any')
url="http://www.creeptd.com"
license=('custom')
depends=('java-runtime')
source=("http://www.creeptd.com/download/$pkgname-linux.tar.gz")
sha256sums=('5ecd7cedbba4f5a61bfd4c1a22eb519129e49498f85fa7d028c2074b48f740eb')

package() {
  cd CreepTD

  # license file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # program directory
  mkdir -p "$pkgdir/opt/"
  cp -r . "$pkgdir/opt/$pkgname"

  # allow all users to access directories (self updating application)
  chmod -R 777 "$pkgdir/opt/$pkgname"

  # desktop file
  cp CreepTD.desktop CreepTD.desktop.template
  sed -i "s/.\/CreepTD/\/opt\/$pkgname\/CreepTD/g" CreepTD.desktop.template
  install -Dm644 CreepTD.desktop.template "$pkgdir/usr/share/applications/CreepTD.desktop"
}
