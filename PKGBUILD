# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=discretize
pkgname=python-${_base}
pkgdesc="Discretization tools for finite volume and inverse problems"
pkgver=0.12.0
pkgrel=1
arch=(any)
url="https://github.com/simpeg/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel meson-python cython)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3292fbd32ffca59b0921d6d812ce91d1205bf9ab6e5c66c9b31b8e5f8accd5263abc0bd5fddb227fa2329634eb3e4f84b8f2711dee7e1246e2b7f9d66460e8a1')

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
