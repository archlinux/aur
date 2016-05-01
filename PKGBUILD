# Maintainer: Shujie Zhang <zhang.shujie87@gmail.com>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=owncloud-news-updater
pkgver=8.4.0
pkgrel=1
pkgdesc="This Python library is a parllel feed updater for the ownCloud News app"
arch=('any')
url="https://github.com/owncloud/news-updater"
license=('GPL3')
depends=('python')
optdepends=('owncloud-news-app: Updating a local instance of the ownCloud News app')
backup=("etc/webapps/owncloud/news/${pkgname}.ini")
makedepends=('python-setuptools')
options=('!strip')
source=("https://github.com/owncloud/news-updater/archive/${pkgver}.tar.gz"
  "${pkgname}.ini"
  "${pkgname}.service"
  "${pkgname}.timer")
sha512sums=('4e0a2d1d67449b8acdbbd90c1a024324080ec8d87b21bded351ba6efa88eb9960f7ea17a6490f8f108cae10a6061630de85cfb82b26ce78d8493307d212a43db'
            '5f1c20fe89f88f318b7285332304c7830d393b219a271eecd652b544175feeaacee15ad0f5aa6bc098308d0ad15dc90a5ea77ded2aa0346f3482b22f8dc62a2b'
            '02e5128cde88e865bac3934e779ed950ff37963440b65c990650d0f9c82d5c740197f4e2c2af0de2743e8fdd96f7c2e3de23fd790aef4489520306656d50fdeb'
            '02d72f414928256be5af84622c34b5f3587444c699e7ee4bb630a8f7cd44f5f886c03c23399fde1b4b4f405c58710d5352fef0b729be70431b728030604d36ef')
install=${pkgname}.install

package() {
  cd $srcdir/news-updater-$pkgver/
  install -d $pkgdir/etc/webapps/owncloud/news
  install -Dm0644 ${srcdir}/${pkgname}.ini $pkgdir/etc/webapps/owncloud/news/${pkgname}.ini
  install -Dm0644 ${srcdir}/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
  install -Dm0644 ${srcdir}/${pkgname}.timer $pkgdir/usr/lib/systemd/system/${pkgname}.timer
  python3 setup.py install --root=$pkgdir
}
