# Maintainer: Paul Irofti <paul@irofti.net>
_name=wntr
pkgname="python-$_name"
pkgver=1.3.2
pkgrel=2

pkgdesc="Water Network Tool for Resilience"
url="https://github.com/USEPA/WNTR"
arch=('any')
license=('Revised BSD')

depends=(python
  python-numpy
  python-setuptools
  python-scipy
  python-networkx
  python-pandas
  python-matplotlib)
makedepends=(swig)

# Clone Github for evaluator.i and other files needed by swig.
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('34a8464d33b1446161c44abe0af0eb87e4684b2fea42aad612962dbed91e39c7')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
