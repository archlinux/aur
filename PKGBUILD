# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=xmovie
pkgname=python-${_base}
pkgdesc="Simply create beautiful movies from xarray objects"
pkgver=0.3.1
pkgrel=1
arch=(any)
url="https://github.com/jbusecke/${_base}"
license=(MIT)
depends=(python-cartopy python-dask python-xarray)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('cd3bbba9d499c51beff30e187100f11d2975550dc86c6fa852a6037af0810f57cbe6682585be3c74ff6f936095063f8eba1ca3ec61dc38b5d088afe15d3c1657')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
