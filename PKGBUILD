# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tcxreader
pkgname=python-${_base}
pkgdesc="Reader for Garmin's TCX file format"
pkgver=0.4.9
pkgrel=1
arch=(any)
url="https://github.com/alenrajsp/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('0af16d815b2feab2e24c96e53b3e504cbe8cbc69369de4f327582af30c776a0f49247d2c775414cc19765ae5566b3291012f659d376d8fc3d9e36f5221d5266d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
