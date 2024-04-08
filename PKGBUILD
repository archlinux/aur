# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tcxreader
pkgname=python-${_base}
pkgdesc="Reader for Garmin's TCX file format"
pkgver=0.4.10
pkgrel=1
arch=(any)
url="https://github.com/alenrajsp/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('48e3abb30006727a69ab206e6bbb699012e48bea43fdb6d7fdf6ffa3aaf6af770a9b3dc5c629cb03c9370760bc9be86ca3dd3d53c6f8e45f0ec1f28bddd6797e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
