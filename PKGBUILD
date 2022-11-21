# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=pytest-mpi
pkgname=python38-${_pkg}
pkgver=0.6
pkgrel=1
pkgdesc="pytest plugin for working with MPI"
arch=(any)
url="https://pytest-mpi.readthedocs.io/"
license=(BSD)
depends=(python38-pytest)
makedepends=(python38-setuptools)
checkdepends=(openmpi python38-mpi4py python38-sybil python38-pytest-mpi)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
#source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('09b3cd3511f8f3cd4d205f54d4a7223724fed0ab68b872ed1123d312152325a9')

build() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  PYTHONPATH="${PWD}"/build/lib pytest -vv --color=yes tests -p pytester --runpytest=subprocess
}

package() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
