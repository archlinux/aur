# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-vector-stores-faiss
pkgname=python-${_name}
pkgver=0.6.0
pkgrel=1
pkgdesc="llama-index vector_stores faiss integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
depends=('python' 'python-llama-index-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('00bfeb6cb7571e0e856566cb4f10c89b415b6108f151d9ad48ee9c31da563f5e')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv test-env
  test-env/bin/pip install installer dist/*.whl --quiet
  test-env/bin/python -c "from llama_index.vector_stores.faiss import FaissVectorStore; print('import OK')"
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
