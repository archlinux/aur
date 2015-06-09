# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pycoind
pkgver=0.0.3
pkgrel=1
pkgdesc="Pure-Python full node and libraries for bitcoind-based crypto-currencies (eg. bitcoin, litecoin, etc)"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/ricmoo/pycoind"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('def32876e7188e1f9e91e6197202c73d')
sha256sums=('9397dbc89c643e21dd7c1464a5f64247ac71d203e2bc94bbc7a2ac6be26c6585')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
