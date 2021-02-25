# Maintainer: Martin Scholz <scholz.m82@gmail.com
pkgname=trytond
pkgver=5.8.4
_pkgdir=5.8
pkgrel=1
pkgdesc="Tryton server"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6' 'python-lxml' 'python-relatorio>=0.7.0'
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
sha256sums=('28e467b51f6dc67b8b4ca60afec82614bba8cf78852c1941cc9071d615ba7972'
            'SKIP'
            'b843e9cc60ef01bea8fff6bdcd5cc1bf0838ff04d140caa8fcf146ff87619ae4'
            'a5c54c8e0408fd757f7688a784ea0ba713c1f46636b5c67858d3817433151f34')
b2sums=('5f007314d6dea15e472e35403a06be311f4a352d31df29fdf961178c2da82a410c3a6b607f55c11eae6a106683b109f9556a5f22155e55f670d94edc93d7cf17'
        'SKIP'
        '5b5af16d3c9d5857a1d751b88028de8d48ec8a803e1a850cf5cb3e9374186bc8df1e3584eaefcde199ef2136746b0c41f16c9b7e7f4b1e379836322381289d85'
        'a34c4be9a2adcc12793c1f6413081e8f7bbe9c5b8bbd78bcb6fa233ea4a89d34e09c797e7aa86dfd5bc4dfd30f6472d0fd65326e323f0c6145115adbfa98c80e')
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

