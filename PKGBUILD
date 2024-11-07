# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=discretize
pkgname=python-${_base}
pkgdesc="Discretization tools for finite volume and inverse problems"
pkgver=0.11.1
pkgrel=1
arch=(any)
url="https://github.com/simpeg/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel meson-python cython)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c9b3e664f9161a0dad61893954473733e70f1c350649b022dde112fd0e062ec192c0aaeb3d64970191927cfa6a7e68d32ca061aefad60231ba79ce7c43ebe703')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
