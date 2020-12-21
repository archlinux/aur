# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-spflow
_pypiname=${pkgname/python-/}
pkgver=0.0.41
pkgrel=1
pkgdesc="Sum-Product Flow: An Easy and Extensible Library for Sum-Product Networks"
arch=('any')
url="https://github.com/SPFlow/SPFlow"
license=('Apache 2.0')
depends=('python' 'python-numpy' 'python-scipy' 'python-statsmodels' 'python-networkx'
  'python-joblib' 'python-matplotlib' 'python-pydot' 'python-lark-parser' 'python-tqdm'
  'python-sympy' 'python-pyqt5' 'python-pytest' 'python-ete' 'python-arff'
  'python-tensorflow-cuda' 'python-pytorch-cuda' 'cppyy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/08/0c/bedbc51f14b194ad04577d9ad5afea24a8df3569fbef227b5ea1b4575047/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('9bc7469a8532a07872cc902acd93d1d179150d478f1cb4804fa3270b8778bfca')

build() {
  cd $srcdir
  # Pull README.md and requirements.txt from Git due to setup.py dependencies.
  wget 'https://raw.githubusercontent.com/SPFlow/SPFlow/master/README.md'
  wget 'https://raw.githubusercontent.com/SPFlow/SPFlow/master/requirements.txt'
  cd ${_pypiname}-${pkgver}
  #patch -p5 < ../../tf2.patch
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
