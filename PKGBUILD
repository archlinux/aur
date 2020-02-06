pkgname=python-basictools
pkgver=1.1
pkgrel=1
pkgdesc="Safran FE helper tools"
arch=('x86_64')
url="https://gitlab.com/DRTI/basic-tools"
license=('BSD')
depends=('python-matplotlib' 'python-scikit-sparse' 'python-pyamg' 'python-pyparsing' 'python-mpi4py' 'python-sympy' 'vtk')
makedepends=('python-setuptools' 'cython' 'eigen')
source=("https://gitlab.com/DRTI/basic-tools/-/archive/v${pkgver}/basic-tools-v${pkgver}.tar.bz2")
sha256sums=('7e4354044714c5a5d815e000109940fbb7dd4edce3140a8b51bcc04ee720c333')

prepare() {
  cd "$srcdir/basic-tools-v$pkgver"
  sed -i "s|enable_MKL = True|enable_MKL = False|g" setup.py
  sed -i "s|useOpenmp = True|useOpenmp = False|g" setup.py
}

package() {
  cd "$srcdir/basic-tools-v$pkgver"
  EIGEN_INC="/usr/include/eigen3" python setup.py install --root="${pkgdir}" --optimize=1
}

