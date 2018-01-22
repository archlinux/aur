# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=declxml
pkgbase='python-declxml'
pkgname=('python-declxml' 'python2-declxml')
pkgver=0.10.0
pkgrel=2
pkgdesc="Declarative XML processing for Python."
arch=('any')
url="https://pypi.python.org/pypi/declxml"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/gatkin/"${_name}"/archive/"${pkgver}".tar.gz)
sha256sums=('aa3d919a5ac41b47dd1e02fc3f135571cbf83dbe3a85a745348d938c81329b1d')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-declxml() {
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-declxml() {
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
