# Maintainer: Damien Nguyen <damien1@huawei.com>

_Name=OpenFermion
_name=${_Name,,}
pkgname=python-$_name

pkgver=1.5.0
pkgrel=1
pkgdesc="The electronic structure package for quantum computers."
arch=('any')
url="https://github.com/quantumlib/OpenFermion"
license=('Apache')
makedepends=('python'
	     'python-setuptools')
checkdepends=('python-numpy'
	      'python-scipy'
              'python-sympy'
              'python-deprecation'
	      'python-networkx'
	      'python-requests'
              'python-h5py'
	      'python-pytest'
	      'jupyter-nbformat'
	      # AUR dependencies
	      'python-pubchempy')
source=("https://github.com/quantumlib/OpenFermion/archive/v$pkgver.tar.gz")
sha256sums=('b1a9db0528ae5ffbc43bab3d3fbb26ce2b1b61fef59c13d043c477bbe9347af8')
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
# sha256sums=('2aede7cf2e5f7be4c0016c9b542c27505644f8ecb9411c653dc89a5cd746f84c')

prepare() {
  cd "$srcdir/$_Name-$pkgver"
  # patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$_Name-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_Name-$pkgver"
  python -m pytest --color=yes -x
}

package() {
  cd "$srcdir/$_Name-$pkgver"
  conflicts=('python-openfermion-0.11')
  depends=('python-deprecation'
           'python-h5py'
           'python-networkx'
           'python-numpy'
	   'python-scipy'
	   'python-sympy'
	   'python-requests'
	   # AUR dependencies
           # missing CirQ...
	   'python-pubchempy')
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
