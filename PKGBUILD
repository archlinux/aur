# Maintainer: Shujie Zhang
# Contributor: Shujie Zhang

pkgname=owncloud-news-updater-git
pkgver=3.001.1112.g79f5e29
pkgrel=3
pkgdesc="A script uses the updater API parallel fetching of RSS feed updates for owncloud-app-news-updater"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('python' 'python-setuptools' 'python-requests')
conflicts=('owncloud-news-updater')
provides=('owncloud-news-updater')
makedepends=()
options=('!strip')
source=("$pkgname::git+https://github.com/owncloud/news.git")
sha512sums=("SKIP")
install=updater.install

pkgver() {
	   cd "$SRCDEST/$pkgname"
	      git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}


package() {
  cd $srcdir/$pkgname/bin/updater/
  mkdir -p $pkgdir/etc/owncloud/news
  install -D -m0644 example-config.ini $pkgdir/etc/owncloud/news/example-updater.ini
  python3 setup.py install --root=$pkgdir
  install -D -m0644 systemd/owncloud-news-updater.service $pkgdir/usr/lib/systemd/system/owncloud-news-updater.service
}
