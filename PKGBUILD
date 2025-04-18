# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-backports.functools_lru_cache
_name=${pkgname#python2-}
pkgver=1.6.4
pkgrel=4
pkgdesc='Backport of functools.lru_cache from Python 3.3 to Python 2.7'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('MIT')
depends=('python2-backports')
makedepends=('python2-setuptools')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d5ed2169378b67d3c545e5600d363a923b09c456dab1593914935a68ad478271')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Remove setuptools_scm dependency
  sed -i /scm/d setup.cfg
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  find "$pkgdir" -path '*/backports/__init__.py*' -delete
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
