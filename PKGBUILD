# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sentence-transformers
pkgname=python-${_base}
pkgver=3.3.1
pkgrel=1
pkgdesc="Multilingual text embeddings"
arch=(any)
url="https://github.com/UKPLab/${_base}"
license=(Apache-2.0)
depends=(python-transformers python-tqdm python-pytorch python-scikit-learn
  python-scipy python-huggingface-hub python-pillow)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d0ab5673f5d74915c25287ec761c7cddf8c180f1f8bd70d9f4c3b8f6f077035d13fc183f813a512b3c0173dafef0758ee18af697af00389f7dab39d01d16dc26')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
