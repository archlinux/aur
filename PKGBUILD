# Maintainer: Paul Irofti <paul@irofti.net>
_name=wntr
pkgname="python-$_name"
pkgver=1.0.0
pkgrel=1

pkgdesc="Water Network Tool for Resilience"
url="https://github.com/USEPA/WNTR"
arch=('any')
license=('Revised BSD')

depends=(python python-numpy python-scipy python-networkx python-pandas
  python-matplotlib)
makedepends=(python-setuptools swig)

# Clone Github for evaluator.i and other files needed by swig.
source=("git+https://github.com/USEPA/WNTR#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_name^^}"
  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd "$srcdir/${_name^^}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
