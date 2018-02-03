# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=spectra
pkgbase='python-spectra'
pkgname=('python-spectra' 'python2-spectra')
pkgver=0.0.10
pkgrel=2
pkgdesc="Color scales and color conversion in Python"
arch=('any')
url="https://pypi.python.org/pypi/spectra"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/09/fb/03db11656c75b19fb18e682dde67eee1096ba09da2bd100ce4b388003006/spectra-0.0.10.tar.gz)
sha256sums=('31300e339d88a051cccfa174e22a0e5317553c048434869196b2ab7b70dcf091')

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
