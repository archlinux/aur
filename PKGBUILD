# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ppmpy
pkgname=python-${_base}
pkgdesc="A PPM hydrodynamics solver written in python"
pkgver=1.0.2
pkgrel=1
arch=(any)
url="https://github.com/python-hydro/${_base}"
license=(BSD-3-Clause)
depends=(python-scipy python-matplotlib)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b6e6e8f24f11bba5b097f514baf33c4b8c7bf1c07cb17785cf99614fccf06e6dc0fdfa3f4d461edb70dfc8ab11c108b75a49e8bd333c06feb4ad95af50ce84d0')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
