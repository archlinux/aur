# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
pkgname=python2-contextlib2
_name=${pkgname#python2-}
pkgver=0.6.0.post1
pkgrel=2
pkgdesc='Backports of the contextlib module'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('Python')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-unittest2')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('01f490098c18b19d2bd5bb5dc445b2054d2fa97f09a4280ba2c5f3c394c8162e')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python2 test_contextlib2.py
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
