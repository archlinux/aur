# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tcxreader
pkgname=python-${_base}
pkgdesc="Reader for Garmin's TCX file format"
pkgver=0.4.6
pkgrel=1
arch=(any)
url="https://github.com/alenrajsp/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('3b58e0c528b73a9f04b3e1af60e8d87a938f56a9185b1d72e3634ac33af70d2bff3ff2315af8638d38da25afb02d566bd6bb72aab5069de106573fd11aec4b98')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
