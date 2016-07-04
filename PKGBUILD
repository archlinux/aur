# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-binary-memcached
pkgname=('python-binary-memcached' 'python2-binary-memcached')
pkgver=0.24.6
_commit=cd1c3fa38a1dd1320787970f67f8a16a2fc4f5b5
pkgrel=1
arch=('any')
pkgdesc='A totally different take on container boilerplate'
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
  python setup.py ptr || warning "Tests failed"

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
