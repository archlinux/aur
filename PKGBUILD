# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=owncloud-news-updater
pkgver=9.0.1
pkgrel=1
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
sha512sums=('a843bc8fb7b84c7c60318ef81c0c7705d7aa0744396e8bc1073bffb36523465f5b781c4c9544e230d8ab42c017633ea27854ea687479025cda931392e5f0cd7d'
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
