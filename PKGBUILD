# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=memoized-property
pkgbase='python-memoized-property'
pkgname=('python-memoized-property' 'python2-memoized-property')
pkgver=1.0.3
pkgrel=3
pkgdesc="Python decorator for defining properties that only run their fget function once"
arch=('any')
url="https://pypi.python.org/pypi/memoized-property"
license=('BSD')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/70/db/23f8b5d86c9385299586c2469b58087f658f58eaeb414be0fd64cfd054e1/memoized-property-1.0.3.tar.gz)
sha256sums=('4be4d0209944b9b9b678dae9d7e312249fe2e6fb8bdc9bdaa1da4de324f0fcf5')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-memoized-property() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-memoized-property() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
