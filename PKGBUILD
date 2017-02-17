# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=owncloud-news-updater
pkgver=9.0.1
pkgrel=2
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
            '99e7b8ec5e6a7536204f300668a89283cbda207d533334e74adf86008baefcd46166c4ae45b29a374ca485500aa7a3c2382981c473f1d33c6b88c6b5a2f6c5ed'
            '0c23459289d06d3a81667746031bf80856f6ef48aa131597b64a5691eb479f1cee4fe2af8095c3004e63c6d83e526e2616e3e35841dfd7bc9577e5cee2babc2a'
            '6bbccde918a81310a16f03111d0a302fb4046c880abe7789086b19ea2839661d5ce703d230c6dd3482df3b8cd53c975f9a0083747f9dfd289dfddfe19939c162')
install=${pkgname}.install

package() {
  cd $srcdir/news-updater-$pkgver/
  install -d $pkgdir/etc/webapps/owncloud/news
  install -Dm0644 ${srcdir}/${pkgname}.ini $pkgdir/etc/webapps/owncloud/news/${pkgname}.ini
  install -Dm0644 ${srcdir}/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
  install -Dm0644 ${srcdir}/${pkgname}.timer $pkgdir/usr/lib/systemd/system/${pkgname}.timer
  python3 setup.py install --root=$pkgdir
}
