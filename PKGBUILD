# Contributor: Florian Walch <florian.walch@gmx.at>
# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond
pkgver=3.8.3
_pkgdir=3.8
pkgrel=2
pkgdesc="A three-tiers high-level general purpose application platform (server application)"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python2>=2.7' 'python2-lxml' 'python2-relatorio>=0.2.0'
         'python2-genshi>=0.5' 'python2-dateutil' 'python2-polib'
         'python2-sql')
optdepends=('python2-psycopg2: support for PostgreSQL database'
  'python-pywebdav: support for WebDAV feature'
  'pydot: support for displaying workflow graphs'
  'python-pytz: timezone support'
  'pyopenssl: support for SSL connection')
makedepends=('python2-distribute')
backup=('etc/trytond.conf')
install="trytond.install"
source=("http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz"
        'trytond.conf'
        'trytond.install'
        'trytond.service')
md5sums=('5000aef75a016444eb082c906718f533'
         'db21177e78e6983d85feb14436f5a7ba'
         'bc93f99ec68feea9f3e3e11e2cb2b735'
         'c3318e663c17194d71f6ef4ded16b293')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -D -m640 "$srcdir/trytond.conf" "$pkgdir/etc/trytond.conf"
  install -D -m755 "$srcdir/trytond.service" "$pkgdir/usr/lib/systemd/system/trytond.service"
}
