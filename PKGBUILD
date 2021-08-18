# Maintainer: Damien Nguyen <damien1@huawei.com>

_Name=OpenFermion
_name=${_Name,,}

pkgver=0.11.0
pkgrel=1
pkgname=python-$_name-${pkgver%.*}
pkgdesc="The electronic structure package for quantum computers."
arch=('any')
url="https://github.com/quantumlib/OpenFermion"
license=('Apache')
makedepends=('python'
	     'python-setuptools')
checkdepends=('python-numpy'
	      'python-scipy'
	      'python-networkx'
	      'python-requests'
	      'python-pytest'
	      'jupyter-nbformat'
	      # AUR dependencies
	      'python-pubchempy')
source=("https://github.com/quantumlib/OpenFermion/archive/v$pkgver.tar.gz")
sha256sums=('339dd51e738a2ea72f86d71b5a9214ca202ace130fadb013835a142647e0a5c4')
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
# sha256sums=('2aede7cf2e5f7be4c0016c9b542c27505644f8ecb9411c653dc89a5cd746f84c')
groups=(python-hiq)

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
  conflicts=('python-openfermion')
  depends=('python-numpy'
	   'python-scipy'
	   'python-networkx'
	   'python-requests'
	   # AUR dependencies
	   'python-pubchempy')
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
