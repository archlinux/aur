# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-spflow
_pypiname=${pkgname/python-/}
pkgver=0.0.39
pkgrel=5
pkgdesc="Sum-Product Flow: An Easy and Extensible Library for Sum-Product Networks"
arch=('any')
url="https://github.com/SPFlow/SPFlow"
license=('Apache 2.0')
depends=('python' 'python-numpy' 'python-scipy' 'python-statsmodels' 'python-networkx'
  'python-joblib' 'python-matplotlib' 'python-pydot' 'python-lark-parser' 'python-tqdm'
  'python-sympy' 'python-pyqt5' 'python-pytest' 'python-ete' 'python-arff' 'python-torchvision'
  'python-tensorflow-cuda' 'python-pytorch-cuda' 'cppyy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/76/49/6b37eaa9bf8c758b99c3f297b39d81bdc5b07329ac674659d67f56493ead/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('a32a237c4ca01742a5dc4cf5ef895423d8275df8d9fac43f3e44e19ee1931a6e')

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
