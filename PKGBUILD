# Maintainer: Shujie Zhang <zhang.shujie87@gmail.com>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=owncloud-news-updater
pkgver=6.0.4
pkgrel=1
pkgdesc="A script uses the updater API parallel fetching of RSS feed updates for owncloud-app-news-updater"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('python' 'python-setuptools' 'python-requests')
makedepends=()
options=('!strip')
source=("https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("475f7df7f16787ac1ea200d4eeb6717317ce0ba975819f739f624cf5366bf5dcac5d029151e76d90e6965aa44c010465df0f6135fd62ad04f58760c596a3e288")
install=updater.install

package() {
  cd $srcdir/news-$pkgver/bin/updater/
  mkdir -p $pkgdir/etc/owncloud/news
  install -D -m0644 example-config.ini $pkgdir/etc/owncloud/news/updater.ini
  python3 setup.py install --root=$pkgdir
  install -D -m0644 systemd/owncloud-news-updater.service $pkgdir/usr/lib/systemd/system/owncloud-news-updater.service

}
