# Maintainer: Martin Scholz <scholz.m82@gmail.com
pkgname=trytond
pkgver=5.6.5
_pkgdir=5.6
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
sha256sums=('a373d73b141d71f8e30d728dd8380955bc0f33daaa097201fa9a952e3663e6d8'
	 'SKIP'
	 'b843e9cc60ef01bea8fff6bdcd5cc1bf0838ff04d140caa8fcf146ff87619ae4'
	 'a5c54c8e0408fd757f7688a784ea0ba713c1f46636b5c67858d3817433151f34')
validpgpkeys=('7C5A4360F6DF81ABA91FD54D6FF50AFE03489130') # Cédric Krier

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -D -m664 "$srcdir/trytond.conf" "$pkgdir/etc/tryton/trytond.conf"
  install -D -m755 "$srcdir/trytond.service" "$pkgdir/usr/lib/systemd/system/trytond.service"
}
