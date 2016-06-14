# Maintainer Andrea Scarpino <andrea@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=nextcloud-news-updater
pkgver=9.0.1
pkgrel=1
pkgdesc="This Python library is a parllel feed updater for the nextCloud News app"
arch=('any')
url="https://github.com/nextcloud/news-updater"
license=('GPL3')
depends=('python')
optdepends=('nextcloud-app-news: Updating a local instance of the nextCloud News app')
backup=("etc/webapps/nextcloud/news/${pkgname}.ini")
makedepends=('python-setuptools')
options=('!strip')
source=("https://github.com/nextcloud/news-updater/archive/${pkgver}.tar.gz"
  "${pkgname}.ini"
  "${pkgname}.service"
  "${pkgname}.timer")
sha512sums=('a843bc8fb7b84c7c60318ef81c0c7705d7aa0744396e8bc1073bffb36523465f5b781c4c9544e230d8ab42c017633ea27854ea687479025cda931392e5f0cd7d'
            'eddaff44bb30f8eff9a63172581aea20a00139211f96d32412930ac5d2af82f10b7bbc390e68ebc901af327a73417ccc07db26056517f1e4f4eb06166a487ce9'
            'c81374ad428f30b8929a8c963d69811d51bafd1bdd09c5b2a8f559c5c7c1b2b18d7553203f9285146fe1a1311bd348166395602c27e3dfaef7b83fdc540d1d87'
            '02d72f414928256be5af84622c34b5f3587444c699e7ee4bb630a8f7cd44f5f886c03c23399fde1b4b4f405c58710d5352fef0b729be70431b728030604d36ef')
install=${pkgname}.install

package() {
  cd $srcdir/news-updater-$pkgver/
  install -d $pkgdir/etc/webapps/nextcloud/news
  install -Dm0644 ${srcdir}/${pkgname}.ini $pkgdir/etc/webapps/nextcloud/news/${pkgname}.ini
  install -Dm0644 ${srcdir}/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
  install -Dm0644 ${srcdir}/${pkgname}.timer $pkgdir/usr/lib/systemd/system/${pkgname}.timer
  python3 setup.py install --root=$pkgdir
}
