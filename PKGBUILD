# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=rednose
pkgbase='python-rednose'
pkgname=('python-rednose')
pkgver=1.3.0
pkgrel=1
pkgdesc="Pretty output formatter with color for python-nosetests"
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('custom')
checkdepends=('python-six' 'python2-six')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('6da77917788be277b70259edc0bb92fc6f28fe268b765b4ea88206cc3543a3e1')

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
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-rednose() {
  depends=('python' 'python-colorama' 'python-termstyle')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
