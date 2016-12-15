# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-binary-memcached
pkgname=('python-binary-memcached' 'python2-binary-memcached')
pkgver=0.25.0
_commit=4b51d7b2a4cb41c918fd2932f67d59fe9fea5ea5
pkgrel=1
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('memcached' 'python-pytest-runner' 'python2-pytest-runner' 'python2-mock')
source=("git+https://github.com/jaysonsantos/python-binary-memcached.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cp -a python-binary-memcached{,-py2}
}

build() {
  cd "$srcdir"/python-binary-memcached
  python setup.py build

  cd "$srcdir"/python-binary-memcached-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/python-binary-memcached
  python setup.py ptr

  cd "$srcdir"/python-binary-memcached-py2
  python2 setup.py ptr
}

package_python-binary-memcached() {
  depends=('python-six')

  cd python-binary-memcached
  python setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-binary-memcached() {
  depends=('python2-six')

  cd python-binary-memcached-py2
  python2 setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
