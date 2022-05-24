# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyina
pkgname=python-${_base}
pkgdesc="MPI parallel map and cluster scheduling"
pkgver=0.2.6
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python-numpy python-mpi4py python-pathos)
makedepends=(python-setuptools)
optdepends=('python-mystic: for mystic models')
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('9d9028fd2c4d97eebdaec2640c92e27395965f101b463f01361a5c73b794abe09630a7e839d0dca3c83ac341ef8f03308483a27a60e317029cd41fc80870e571')

build() {
  cd ${_base}-${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
