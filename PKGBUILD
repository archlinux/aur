# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-retrievers-bm25
pkgname=python-${_name}
pkgver=0.7.1
pkgrel=1
pkgdesc="llama-index retrievers bm25 integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
depends=('python' 'python-bm25s' 'python-llama-index-core' 'python-pystemmer')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('65bff95c5c1354854394209406d2d342ff5e62983ff2818fd2b85d5bed70bed0')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv test-env
  test-env/bin/pip install installer dist/*.whl --quiet
  test-env/bin/python -c "from llama_index.retrievers.bm25 import BM25Retriever; print('import OK')"
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
