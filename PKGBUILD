# Maintainer: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-daemon
pkgname=(python-daemon python2-daemon)
pkgver=2.1.0
pkgrel=2
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=(any)
url='https://pypi.python.org/pypi/python-daemon'
license=(Apache)
makedepends=(python-setuptools python2-setuptools python-docutils python2-docutils python-lockfile python2-lockfile)
checkdepends=(python-mock python2-mock python-testscenarios python2-testscenarios)
source=(https://pypi.python.org/packages/source/p/python-daemon/python-daemon-$pkgver.tar.gz)
sha1sums=('4a4e406a40bc69601d0da9c7804a4e3349d7805d')

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
  python setup.py test

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
