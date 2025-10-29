# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=insipid
pkgname=python-sphinx-${_base}-theme
pkgver=0.4.3
pkgrel=1
pkgdesc="An insipid Sphinx theme"
arch=(any)
url="https://github.com/mgeier/${_base}-sphinx-theme"
license=(BSD-2-Clause)
depends=(python-sphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-sphinx-last-updated-by-git)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c604a86d5b3110725a2cb559c213dadef8367e6b72cfc6139ede7a38422ade0314c4e076e887ed735b27aaf8693145998352d4eccd264213863dc452377c1136')

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
