# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-spflow
_pypiname=${pkgname/python-/}
pkgver=0.0.40
pkgrel=1
pkgdesc="Sum-Product Flow: An Easy and Extensible Library for Sum-Product Networks"
arch=('any')
url="https://github.com/SPFlow/SPFlow"
license=('Apache 2.0')
depends=('python' 'python-numpy' 'python-scipy' 'python-statsmodels' 'python-networkx'
  'python-joblib' 'python-matplotlib' 'python-pydot' 'python-lark-parser' 'python-tqdm'
  'python-sympy' 'python-pyqt5' 'python-pytest' 'python-ete' 'python-arff' 'python-torchvision'
  'python-tensorflow-cuda' 'python-pytorch-cuda' 'cppyy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/18/95/f22f40e7e53c3d7b2bb0c698aa723b701b844efcb7cad7d6667bd5bfadd1/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('90183d810894dc1dcdc0ec63b7757b502d5b316311c4b91c07e892288a1f9d2e')

build() {
  cd $srcdir
  # Pull README.md and requirements.txt from Git due to setup.py dependencies.
  wget 'https://raw.githubusercontent.com/SPFlow/SPFlow/master/README.md'
  wget 'https://raw.githubusercontent.com/SPFlow/SPFlow/master/requirements.txt'
  cd ${_pypiname}-${pkgver}
  patch -p5 < ../../tf2.patch
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

#check() {
#  cd $srcdir/${_pypiname}-${pkgver}
#  pytest
#}
