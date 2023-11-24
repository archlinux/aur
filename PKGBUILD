# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tcxreader
pkgname=python-${_base}
pkgdesc="Reader for Garmin's TCX file format"
pkgver=0.4.5
pkgrel=1
arch=(any)
url="https://github.com/alenrajsp/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('217bad87f8362091435a95fdc5976a1082bdafd06ada60fc2bad90ff44739a4f162c40b219659a48be5b00e47896ed5b10e1ca04a3a46a74bfcc1d2c6f64a86e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
