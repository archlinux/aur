# Maintainer: Anatol Pomozov

pkgbase=python-tarantool
pkgname=(python-tarantool python2-tarantool)
pkgver=0.5.4
pkgrel=2
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=(any)
url='https://github.com/tarantool/tarantool-python'
license=(BSD)
makedepends=(python-setuptools python2-setuptools python-msgpack python2-msgpack python-yaml python2-yaml python-six python2-six)
source=(https://pypi.python.org/packages/source/t/tarantool/tarantool-$pkgver.tar.gz)
sha1sums=('676f40e2ed9114f14940884dfd9bdef7d744515f')

prepare() {
  cp -a tarantool-$pkgver{,-py2}
}

build() {
  cd "$srcdir/tarantool-$pkgver"
  python setup.py build

  cd "$srcdir/tarantool-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/tarantool-$pkgver"
  # currently tests fail for python3
  python setup.py test

  cd "$srcdir/tarantool-$pkgver-py2"
  python2 setup.py test
}

package_python-tarantool() {
  depends=(python python-msgpack python-yaml python-six)

  cd "$srcdir/tarantool-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-tarantool() {
  depends=(python2 python2-msgpack python2-yaml python2-six)

  cd "$srcdir/tarantool-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
