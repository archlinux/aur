# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-binary-memcached
pkgname=('python-binary-memcached' 'python2-binary-memcached')
pkgver=0.27.0
pkgrel=1
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('memcached' 'python-pytest-runner' 'python2-pytest-runner' 'python2-mock')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jaysonsantos/python-binary-memcached/archive/v$pkgver.tar.gz")
sha512sums=('379bc876c4834a3c46dbfeada8a6810656eb255f3b26655f058e058c9e571ccd10831d51c19a2c65f1b54d65829c9cadad87ee588a3728e8d37d5835785f97e8')

prepare() {
  cp -a python-binary-memcached-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/python-binary-memcached-$pkgver
  python setup.py build

  cd "$srcdir"/python-binary-memcached-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/python-binary-memcached-$pkgver
  python setup.py pytest

  cd "$srcdir"/python-binary-memcached-$pkgver-py2
  python2 setup.py pytest
}

package_python-binary-memcached() {
  depends=('python-six')

  cd python-binary-memcached-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-binary-memcached() {
  depends=('python2-six')

  cd python-binary-memcached-$pkgver-py2
  python2 setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
