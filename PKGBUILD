
pkgbase=python-scikit-optimize
pkgname=('python2-scikit-optimize' 'python-scikit-optimize')
pkgver=0.4
pkgrel=1
pkgdesc="Sequential model-based optimization toolbox."
arch=('any')
url="http://scikit-optimize.org/"
license=('BSD')
makedepends=('python2-scikit-learn' 'python-scikit-learn' 'python2-matplotlib'
             'python-matplotlib' python-setuptools python2-setuptools)
options=(!emptydirs)
source=(https://pypi.python.org/packages/32/66/361bb509e9e2bc69186c599922dbb1fe16e229afb4140ec7e8040b80f0c9/scikit-optimize-${pkgver}.tar.gz)
sha256sums=('c01d5b9f31105172067b1df18d15c277a15c81580317c2b002d8e63df6216156')

prepare() {
  cd "$srcdir"
  cp -a scikit-optimize-$pkgver scikit-optimize-py2-$pkgver
  cd scikit-optimize-py2-$pkgver

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python2"
  cd "$srcdir"/scikit-optimize-py2-$pkgver
  python2 setup.py build

  msg "Building Python3"
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py build
}

package_python2-scikit-optimize() {
  depends=('python2-scikit-learn' 'python2-matplotlib')
  cd "$srcdir"/scikit-optimize-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

package_python-scikit-optimize() {
  depends=('python-scikit-learn' 'python-matplotlib')
  cd "$srcdir"/scikit-optimize-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

}

