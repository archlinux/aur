# Contributor: Jakob Nixdorf <flocke@shadowice.org>
_base=npTDMS
pkgname=python-${_base,,}
pkgver=1.4.0
pkgrel=1
pkgdesc="Cross-platform, NumPy based module for reading TDMS files produced by LabView"
arch=(any)
url="https://github.com/adamreeve/${_base}"
license=(LGPL3)
depends=(python-numpy)
makedepends=(python-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('8fbfd795b3507e5f3b9abea91fa8c9b0d1924bf87be8f2a1e01635c7267111a51e49d8da8069b715a43ecec4b3701f1816c35cf25a938d7b23a05a64bbbb8929')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
