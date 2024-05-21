# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=discretize
pkgname=python-${_base}
pkgdesc="Discretization tools for finite volume and inverse problems"
pkgver=0.10.0
pkgrel=1
arch=(any)
url="https://github.com/simpeg/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel meson-python cython)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6b63e073953881178bf4f022591689549b3edef8d223e50d2e60d49543b9a2b200ade3d4a904b0adac787f8ff943b8250c930caf55439aacad460fa8053d3194')

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
