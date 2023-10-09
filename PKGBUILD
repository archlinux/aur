# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=insipid
pkgname=python-sphinx-${_base}-theme
pkgver=0.4.2
pkgrel=1
pkgdesc="An insipid Sphinx theme"
arch=(any)
url="https://github.com/mgeier/${_base}-sphinx-theme"
license=('custom:BSD-2-clause')
depends=(python-sphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-sphinx-last-updated-by-git)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('90bf1c8bc62ddbe8013884207b409202da075bf189ca8d9a96c5b105bb04b34db9b3f80047d4b1afe1183bb674e9eaf2da64c02ed875149177168390a5f80221')

build() {
  cd ${_base}-sphinx-theme-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-sphinx-theme-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m sphinx -d _build/doctrees/ doc/ _build/html/ -b html
# }

package() {
  cd ${_base}-sphinx-theme-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
