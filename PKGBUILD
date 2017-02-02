# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=nextcloud-news-updater
pkgver=9.0.1
pkgrel=3
pkgdesc="This Python library is a parllel feed updater for the nextCloud News app"
arch=('any')
url="https://github.com/nextcloud/news-updater"
license=('GPL3')
depends=('python-setuptools')
optdepends=('nextcloud-app-news: Updating a local instance of the nextCloud News app')
backup=("etc/webapps/nextcloud/news/${pkgname}.ini")
options=('!strip')
conflicts=('owncloud-news-updater')
source=("https://github.com/nextcloud/news-updater/archive/${pkgver}.tar.gz"
  "${pkgname}.ini"
  "${pkgname}.service"
  "${pkgname}.timer")
sha512sums=('a843bc8fb7b84c7c60318ef81c0c7705d7aa0744396e8bc1073bffb36523465f5b781c4c9544e230d8ab42c017633ea27854ea687479025cda931392e5f0cd7d'
            '4c8f923d8b43e718a46ee21dc18e6dabb2d6bc1cd7701d84f7fb00d13a4c2c83e504eb20a83e2ba1c1d668ef86096c895c405c2df25f20db6a09c22845500399'
            '37de9479cfd104c36bbe64ea3586686dc066a82a3fc03ce61f5351045ecd3bdc9bb33758d5a14e43a30638bda62e849d12e903ecc055ebd62ef2894213290745'
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
