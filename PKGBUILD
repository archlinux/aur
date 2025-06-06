# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=discretize
pkgname=python-${_base}
pkgdesc="Discretization tools for finite volume and inverse problems"
pkgver=0.11.3
pkgrel=1
arch=(any)
url="https://github.com/simpeg/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel meson-python cython)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fae9118483037f771a938c85dab935560240a43bf1b83086b59c247af386f96382f86685e6efd8c0819f85cac6fa80556985ca5956a5a17927cfbee12c467bb9')

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
