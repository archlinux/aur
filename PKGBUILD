# Maintainer: Paul Irofti <paul@irofti.net>
_name=wntr
pkgname="python-$_name"
pkgver=1.1.0
pkgrel=1

pkgdesc="Water Network Tool for Resilience"
url="https://github.com/USEPA/WNTR"
arch=('any')
license=('Revised BSD')

depends=(python python-numpy python-scipy python-networkx python-pandas
  python-matplotlib)
makedepends=(python-setuptools swig)

# Clone Github for evaluator.i and other files needed by swig.
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('aed676833b6ca19b095ad26b7f0028107afef5a5c75a8aaed0ff98014405d752')

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
