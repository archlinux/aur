# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=owncloud-news-updater
pkgver=9.0.0
pkgrel=3
pkgdesc="This Python library is a parllel feed updater for the ownCloud News app"
arch=('any')
url="https://github.com/owncloud/news-updater"
license=('GPL3')
depends=('python')
optdepends=('owncloud-app-news: Updating a local instance of the ownCloud News app')
backup=("etc/webapps/owncloud/news/${pkgname}.ini")
makedepends=('python-setuptools')
options=('!strip')
source=("https://github.com/owncloud/news-updater/archive/${pkgver}.tar.gz"
  "${pkgname}.ini"
  "${pkgname}.service"
  "${pkgname}.timer")
sha512sums=('73c48e254ecbfab3c6214daee492b1b219a5d565699162e14ed70a3b7a320c705a427a19af2355b6f73afd6e39ad95f9fb534fe5bf8d4c5d870646b43da6d3bb'
            '5ca79bc044ff5850dc5422df54e094ea4a808c152ba965e75535f08beadfcb790a2479fb9a5dee23736d730f54b09d0936944b9f1de16037bb5de6ac6036975e'
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
