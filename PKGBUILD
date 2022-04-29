# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ffcx
pkgname=python-fenics-${_base}
pkgdesc="The FEniCSx Form Compiler"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
depends=(python-fenics-ufl python-fenics-basix python-cffi)
makedepends=(python-setuptools python-wheel)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('70be2ea3b97fca6646d59387ae05aff18ce11447e4ddaff3e75411ffc0216fae1d138681e25d82d741739b9bb18ed802d198f6f354f7056963c93ac4da4433ea')

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
