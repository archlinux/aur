# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyina
pkgname=python-${_base}
pkgdesc="MPI parallel map and cluster scheduling"
pkgver=0.2.7
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python-numpy python-mpi4py python-pathos)
makedepends=(python-setuptools)
optdepends=('python-mystic: for mystic models')
source=(${_base}-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('63c85557f6e8a4366eff38152896057957683268e373ac5907ae8ff0b1c2b9cafe47892325159489f71a9123d863556a191a4ef4eb6a694f87b25539cad52e5c')

build() {
  cd ${_base}-${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
