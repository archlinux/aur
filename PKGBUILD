# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyina
pkgname=python-${_base}
pkgdesc="MPI parallel map and cluster scheduling"
pkgver=0.2.5
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=('any')
license=('BSD')
depends=(python-numpy python-mpi4py python-pathos)
makedepends=(python-setuptools)
optdepends=('python-mystic: for mystic models')
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('595fa2bdfb1847a397407281944f67c7489d6fb944762808c945bd7330fe1cab8c2a192414479e7728971bc96690579703c2fc2c4a73fb831359cba4d46b0b58')

build() {
  cd "${_base}-${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
