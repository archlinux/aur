# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-doublex
pkgname=('python-doublex' 'python2-doublex')
pkgver=1.9.1
pkgrel=1
pkgdesc="Powerful test doubles framework for Python"
arch=('any')
license=('GPL')
url="https://github.com/davidvilla/python-doublex"
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyhamcrest' 'python2-pyhamcrest')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/davidvilla/python-doublex/archive/v$pkgver.tar.gz")
sha512sums=('de0bab7e2f889baff10c2596427bc72611878a5539bebbd4ef570a964d21dc88dabc651c5e510eeb7dabe4ca80bca705095c5740de518e3f01221dc29e29273a')

prepare() {
  cp -a python-doublex-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/python-doublex-$pkgver
  python setup.py build

  cd "$srcdir"/python-doublex-$pkgver-py2
  python2 setup.py build
}

check() { (
  cd "$srcdir"/python-doublex-$pkgver
  python setup.py test

  cd "$srcdir"/python-doublex-$pkgver-py2
  python2 setup.py test
  ) || warning "Tests failed as expected"
}

package_python-doublex() {
  depends=('python-pyhamcrest')

  cd python-doublex-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/README.rst
}

package_python2-doublex() {
  depends=('python2-pyhamcrest')

  cd python-doublex-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/README.rst
}
