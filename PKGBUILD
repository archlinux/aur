# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=rednose
pkgbase='python-rednose'
pkgname=('python-rednose' 'python2-rednose')
pkgver=1.2.3
pkgrel=2
pkgdesc="Pretty output formatter with color for python-nosetests"
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('custom')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/e2/7d/7c46f895be2641a40a5db7ca53670e676518c859f5e2cdb9bea4481cddd9/rednose-1.2.3.tar.gz)
sha256sums=('d0c88a722ef98d731e2d19dc33969b7bcb0368632fc87d3401b871b24ab7a587')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-rednose() {
  depends=('python2' 'python2-colorama' 'python2-termstyle')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-rednose() {
  depends=('python' 'python-colorama' 'python-termstyle')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
