# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-binary-memcached
pkgname=('python-binary-memcached' 'python2-binary-memcached')
pkgver=0.26.1
_commit=769d5e9fcab1e9592b1a5e5e937a52049639c246
pkgrel=2
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('memcached' 'python-pytest-runner' 'python2-pytest-runner' 'python2-mock')
source=("$pkgbase-$_commit.tar.gz::https://github.com/jaysonsantos/python-binary-memcached/archive/$_commit.tar.gz")
sha512sums=('2437fa7435f57fa8a5c9ccce4bdff1f2239418a3df894b40f23f3d0fa714a42fffb06af84c6bad8442c05aa136104822ddbfbd71bf1a144ddb95919e5c582d48')

prepare() {
  cp -a python-binary-memcached-$_commit{,-py2}
}

build() {
  cd "$srcdir"/python-binary-memcached-$_commit
  python setup.py build

  cd "$srcdir"/python-binary-memcached-$_commit-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/python-binary-memcached-$_commit
  python setup.py pytest

  cd "$srcdir"/python-binary-memcached-$_commit-py2
  python2 setup.py pytest
}

package_python-binary-memcached() {
  depends=('python-six')

  cd python-binary-memcached-$_commit
  python setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-binary-memcached() {
  depends=('python2-six')

  cd python-binary-memcached-$_commit-py2
  python2 setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
