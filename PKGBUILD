# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=spectra
pkgbase='python-spectra'
pkgname=('python-spectra' 'python2-spectra')
pkgver=0.0.11
pkgrel=2
pkgdesc="Color scales and color conversion in Python"
arch=('any')
url="https://pypi.python.org/pypi/spectra"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${_name}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/50/50/ae8d87ab681a58e246215e51715566df8074a86d244fee31fa8585fe5f9f/spectra-0.0.11.tar.gz)
sha256sums=('8eb362a5187cb63cee13cd01186799c0c791a3ad3bec57b279132e12521762b8')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-spectra() {
  depends=('python2' 'python2-networkx' 'python2-colormath')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-spectra() {
  depends=('python' 'python-networkx' 'python-colormath')
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
