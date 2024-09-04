# Maintainer: Arturo Penen <apenen@gmail.com>
_base=elasticsearch
pkgname=python-${_base}7
pkgver=7.17.11
pkgrel=1
pkgdesc="Python client for Elasticsearch 7"
arch=(any)
url="https://github.com/elastic/${_base}-py"
license=(Apache-2.0)
depends=(python-dateparser)
makedepends=(python-build python-installer python-setuptools python-wheel) # python-sphinx_rtd_theme
conflicts=('elasticsearch')
# checkdepends=(python-pytest-mock python-mock python-pytest-asyncio python-nltk
#   python-sentence-transformers)
source=(${_base}-py-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('8bb25bcd2f1aa6b0b9bac2efc1da5d3ae189eac517d5106391d4c1a0160c98811c8fbd5b00c98e34eca454e02038db095614176dbc028b20bbad78d02df68725')

build() {
  cd ${_base}-py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  # cd docs
  # PYTHONPATH="${srcdir}/${_base}-py-${pkgver}/build/lib/:${PYTHONPATH}" make man
}

# check() {
#   cd ${_base}-py-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  # install -Dm 644 docs/_build/man/${_base}.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
#  cp -a examples "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

