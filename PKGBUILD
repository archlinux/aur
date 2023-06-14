# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=insipid
pkgname=python-sphinx-${_base}-theme
pkgver=0.4.1
pkgrel=1
pkgdesc="An insipid Sphinx theme"
arch=(any)
url="https://github.com/mgeier/${_base}-sphinx-theme"
license=('custom:BSD-2-clause')
depends=(python-sphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-sphinx-last-updated-by-git)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0342e63cedb08023c174f4f2a66fb4ef81ee9f7b2baaa250ae0822f481195ad11755d623a5f7672b3e0bae1981eae1e5ab182cf21a7b682820c32eda9d425531')

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
