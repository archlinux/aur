# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=Crimson
pkgbase='python-crimson'
pkgname=('python-crimson' 'python2-crimson')
pkgver=0.3.0
pkgrel=1
pkgdesc="Bioinformatics tool outputs converter to JSON or YAML"
arch=('any')
url="https://pypi.python.org/pypi/crimson"
license=('BSD')
makedepends=(
  'python' 'python-setuptools' 'python2-wheel'
  'python2' 'python2-setuptools' 'python-wheel')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/bf/8e/cdddc397f92fc1199195f01446bd3407dcb6f6ab8983f32a5e8798348809/Crimson-0.3.0.tar.gz)
sha256sums=('7f78aca574cc9be93ca61baa91873867b40254441b77dddf86099b9071623a9b')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-crimson() {
  depends=('python2' 'python2-click' 'python2-yaml')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-crimson() {
  depends=('python' 'python-click' 'python-yaml')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
