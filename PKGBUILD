# Maintainer: Martin Scholz <scholz.m82@gmail.com
pkgname=trytond
pkgver=5.2.2
_pkgdir=5.2
pkgrel=1
pkgdesc="A three-tiers high-level general purpose application platform (server application)"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5' 'python-lxml' 'python-relatorio>=0.7.0'
         'python-genshi' 'python-dateutil' 'python-polib'
         'python-sql>=0.5' 'python-werkzeug' 'python-wrapt'
	 'python-passlib')
optdepends=('python-psycopg2: support for PostgreSQL database'
  'python-pydot: support for displaying workflow graphs'
  'python-levenshtein'
  'python-bcrypt'
  'python-html2text'
  'python-gevent')
makedepends=('python-distribute')
backup=('etc/trytond.conf')
install="trytond.install"
source=("http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz"
        "http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz.asc"
        'trytond.conf'
        'trytond.service')
sha256sums=('df86add7e60cb06c7705b8a237b207024f42ae9c0e981357a1dc478b34da7e34'
	 'SKIP'
	 '5fa15f98ccf96359323b6fdb0aa908f5960d238f1ca9343b11abddc8cad497c9'
	 '6231a678947f08d33159fd6fabfc27708be6b2fabee27adfd249445b7cd121f0')
validpgpkeys=('7C5A4360F6DF81ABA91FD54D6FF50AFE03489130') # Cédric Krier

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -D -m640 "$srcdir/trytond.conf" "$pkgdir/etc/trytond.conf"
  install -D -m755 "$srcdir/trytond.service" "$pkgdir/usr/lib/systemd/system/trytond.service"
}
