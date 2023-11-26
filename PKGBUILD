# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>
_base=scikit-umfpack
pkgname=python-${_base}
pkgver=0.4.0
pkgrel=1
pkgdesc="Python interface to UMFPACK sparse direct solver"
url="https://${_base}.github.io/${_base}"
depends=(suitesparse python-scipy)
makedepends=(python-build python-installer meson-python python-wheel swig)
license=('custom:BSD-3-clause')
arch=('x86_64')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base/-/_}-${pkgver}.tar.gz)
sha512sums=('284dc757cf7ebd1ca5aa05ca1a2778b2dee99eba7b345b74d2e2b4a7fd79058eb4f4e67f3d4582b28c57d74db2efb5dfdcfaf88154f5972082767e524fe3d6e6')

build() {
  cd ${_base/-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base/-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
