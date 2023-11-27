# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>
_base=scikit-umfpack
pkgname=python-${_base}
pkgver=0.4.1
pkgrel=1
pkgdesc="Python interface to UMFPACK sparse direct solver"
url="https://${_base}.github.io/${_base}"
depends=(suitesparse python-scipy)
makedepends=(python-build python-installer meson-python python-wheel swig)
license=('custom:BSD-3-clause')
arch=('x86_64')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base/-/_}-${pkgver}.tar.gz)
sha512sums=('f88eb24b8e35a4fe6d3912f136cdcfce48ac1ae188036f9b74f8aa4584e58d13751a3a0e8ea01ff0bce6a51399e215e74c3be444680433f15c112c7099c536e8')

build() {
  cd ${_base/-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base/-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
