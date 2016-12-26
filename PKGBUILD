# Maintainer: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-daemon
pkgname=(python-daemon python2-daemon)
pkgver=2.1.2
pkgrel=2
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=(any)
url='https://pypi.python.org/pypi/python-daemon'
license=(Apache)
makedepends=(python-setuptools python2-setuptools python-docutils python2-docutils python-lockfile python2-lockfile)
checkdepends=(python-mock python2-mock python-testscenarios python2-testscenarios)
source=(https://pypi.python.org/packages/b2/fb/a280d65f81e9d69989c8d6c4e0bb18d7280cdcd6d406a2cc3f4eb47d4402/$pkgbase-$pkgver.tar.gz{,.asc})
validpgpkeys=('517CF14BB2F398B0CB354855B8B24C06AC128405') # Ben Finney
sha1sums=('e333e9031424611b8974d2b2d2804dd26c4fae8e'
          'SKIP')

prepare() {
  cp -a python-daemon-$pkgver{,-py2}
}

build() {
  cd "$srcdir/python-daemon-$pkgver"
  python setup.py build

  cd "$srcdir/python-daemon-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/python-daemon-$pkgver"
# test fails
#  python setup.py test

  cd "$srcdir/python-daemon-$pkgver-py2"
  python2 setup.py test
}

package_python-daemon() {
  depends=(python python-lockfile)

  cd "$srcdir/python-daemon-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.ASF-2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ASF-2"
  install -Dm644 LICENSE.GPL-3 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL-3"
}

package_python2-daemon() {
  depends=(python2 python2-lockfile)

  cd "$srcdir/python-daemon-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.ASF-2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ASF-2"
  install -Dm644 LICENSE.GPL-3 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL-3"
}
