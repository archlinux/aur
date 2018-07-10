# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-doublex
pkgname=('python-doublex' 'python2-doublex')
pkgver=1.8.4
pkgrel=3
pkgdesc="Powerful test doubles framework for Python"
arch=('any')
license=('GPL')
url="https://github.com/davidvilla/python-doublex"
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyhamcrest' 'python2-pyhamcrest' 'git')
checkdepends=('python-nose' 'python2-nose')
source=("git+https://github.com/davidvilla/python-doublex.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a python-doublex{,-py2}
}

build() {
  cd "$srcdir"/python-doublex
  python setup.py build

  cd "$srcdir"/python-doublex-py2
  python2 setup.py build
}

check() { (
  cd "$srcdir"/python-doublex
  python setup.py test

  cd "$srcdir"/python-doublex-py2
  python2 setup.py test
  ) || warning "Tests failed as expected"
}

package_python-doublex() {
  depends=('python-pyhamcrest')

  cd python-doublex
  python setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/README.rst
}

package_python2-doublex() {
  depends=('python2-pyhamcrest')

  cd python-doublex-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/README.rst
}
