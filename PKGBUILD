# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sentence-transformers
pkgname=python-${_base}
pkgver=3.0.1
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
sha512sums=('f6b53bf702a2d7996b7d3354df694a8ac4974e3e2a06617a7936bd48f6dcdf67ed76499bf9dc6fbd20772dbb67a7057026481bbd18a9e2185ba4e80a180507c4')

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
