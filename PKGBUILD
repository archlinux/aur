# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=sphinx-comments
pkgname=python-${_base}
pkgdesc="Add comments and annotation to your documentation"
pkgver=0.0.3
pkgrel=3
arch=(any)
url="https://github.com/executablebooks/${_base}"
license=(MIT)
depends=(python-sphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest-regressions python-myst-parser python-beautifulsoup4)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e2172341a9d5474940251edaee290be9f3c0eed54750e6798d5f6c1da2a774690a087f4971b107eaee298b6062a0c0f76aa51df36be8073a1b205f96906848a3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
