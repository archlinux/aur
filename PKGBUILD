# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=geneimpacts
pkgbase='python-geneimpacts'
pkgname=('python-geneimpacts' 'python2-geneimpacts')
pkgver=0.3.4
pkgrel=1
pkgdesc="Compare and normalize effects from variant annotation tools (snpEff, VEP)"
arch=('any')
url="https://pypi.python.org/pypi/geneimpacts"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/c9/0d/cdb5d3c45a65f33563d98838e89a6e37dad091cd10842a5c9f472503a8a3/geneimpacts-0.3.4.tar.gz)
sha256sums=('bdd841977135ea81a75f2a58d7b9bce1a13682ca0c09eab18de42309257d893f')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-geneimpacts() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-geneimpacts() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
