# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>
# Maintainer: khomutsky <bogdan@khomutsky.com>


pkgbase=python-algopy
pkgname=('python2-algopy' 'python-algopy')
pkgver=0.5.7
pkgrel=1
pkgdesc='A tool for Algorithmic Differentiation (AD) and Taylor polynomial approximations.'
url='https://pythonhosted.org/algopy/'
license=('BSD')
arch=('any')
depends=()
makedepends=('python2-setuptools' 'python-setuptools')
options=('!libtool')
source=("https://pypi.python.org/packages/source/a/algopy/algopy-${pkgver}.zip")
sha256sums=('6955f676fce3858fa3585cb7f3f7e1796cb93377d24016419b6699291584b7df') 

prepare() {
  cd "$srcdir"
  cp -a algopy-${pkgver} algopy-py2-${pkgver}
}

build() {
  msg2 "Building algopy - Python2"
  cd "${srcdir}/algopy-py2-${pkgver}"
  python2 setup.py build

  msg2 "Building algopy - Python3"
  cd "${srcdir}/algopy-${pkgver}"
  python setup.py build
}

package_python-algopy() {
  depends=('python-numpydoc')
  optdepends=()
  msg2 "Installing algopy python3"
  cd "${srcdir}/algopy-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
  
}

package_python2-algopy() {
#  depends=('python2-numpydoc')
  optdepends=()
  msg2 "Installing algopy python2"
  cd "${srcdir}/algopy-py2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}

