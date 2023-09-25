# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sphinx-design
pkgname=python-${_base}
pkgdesc="A sphinx extension for designing beautiful, view size responsive web components"
pkgver=0.5.0
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${_base}"
license=(MIT)
depends=(python-sphinx)
makedepends=(python-build python-flit-core python-installer)
# checkdepends=(python-pytest-regressions python-myst-parser)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('26369c17d519e9a8f6a4bfdb68db60599e33c1db867037fdced6292439a9fcbe6a312c2d17ada058b14c95878ced7679bf6b64d7d4f13194f19502cd9be93b69')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest --ignore=tests/test_snippets.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
