# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=datashader
pkgname=python-${_base}
pkgver=0.19.1
pkgrel=1
pkgdesc="Quickly and accurately render even the largest data"
arch=(any)
url="https://${_base}.org"
license=(BSD-3-Clause)
depends=(python-colorcet python-multipledispatch python-numba python-pandas python-param  python-scipy python-xarray)
makedepends=(python-build python-installer python-hatch-vcs python-wheel)
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('a374c7693648b2c7273ac2f016b6f4c2afb6c79613fb033cb8ff9463482beac2f47a306ed74e9ff2dfbf43f1a80bfa1d4ba423004934b3ae182cd97cd2ee309b')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
