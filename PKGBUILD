# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman
pkgver=1
pkgrel=1
pkgdesc="Enlightenment ConnMan user interface"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python2-elementary' 'python2-e_dbus' 'python2-edje' 'python2-ecore' 'connman')
source=("http://packages.profusion.mobi/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('cec2bd0aaf9d8975dd69ac6b5a4e638e')

prepare() {
# Run with python2
  sed -i 's:/usr/bin/python$:&2:' "$srcdir/$pkgname-$pkgver/econnman-bin.in"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  PYTHON=/usr/bin/python2 \
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
