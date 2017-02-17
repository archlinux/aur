# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=nextcloud-news-updater
pkgver=9.0.1
pkgrel=6
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
            'eddaff44bb30f8eff9a63172581aea20a00139211f96d32412930ac5d2af82f10b7bbc390e68ebc901af327a73417ccc07db26056517f1e4f4eb06166a487ce9'
            '338004f1c60be94a669838d6751a021eb0f0aa0d041af099ad1a8f0121c1032e1d02340e810af78a7dfb07342c420ac7b0102fd4bd419b6b1b110cf8f45f3b14'
            'dd06c06249bc9537555517d97a66dbaefcfcc27547a03abb3cf8bcb15edbda1f49cb03191dbebb8ad6737bdf46c1f25567636fa1c206b60a39d22ce41c506aaa')
install=${pkgname}.install

package() {
  cd $srcdir/news-updater-$pkgver/
  install -d $pkgdir/etc/webapps/nextcloud/news
  install -Dm0644 ${srcdir}/${pkgname}.ini $pkgdir/etc/webapps/nextcloud/news/${pkgname}.ini
  install -Dm0644 ${srcdir}/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
  install -Dm0644 ${srcdir}/${pkgname}.timer $pkgdir/usr/lib/systemd/system/${pkgname}.timer
  python3 setup.py install --root=$pkgdir
}
