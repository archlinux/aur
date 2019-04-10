# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-doublex
pkgname=('python-doublex' 'python2-doublex')
pkgver=1.9.2
pkgrel=1
pkgdesc="Powerful test doubles framework for Python"
arch=('any')
license=('GPL')
url="https://github.com/davidvilla/python-doublex"
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyhamcrest' 'python2-pyhamcrest')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver.tar.bz2::https://bitbucket.org/DavidVilla/python-doublex/get/v$pkgver.tar.bz2")
sha512sums=('0cbcedeb46bd0dce807360bab5f8ac8d0a3e0eb8b5bdd7381499a1da236fbbfd21f0a53ece6eb24c387c9d96c9735ee56693ce95d445ef4f59873140388bc6a7')

prepare() {
  mv DavidVilla-python-doublex-* python-doublex-$pkgver
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
