# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-embeddings-openai
pkgname=python-${_name}
pkgver=0.6.0
pkgrel=1
pkgdesc="llama-index embeddings openai integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
depends=('python' 'python-openai' 'python-llama-index-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('eb3e6606be81cb89125073e23c97c0a6119dabb4827adbd14697c2029ad73f29')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv test-env
  test-env/bin/pip install installer dist/*.whl --quiet
  test-env/bin/python -c "from llama_index.embeddings.openai import OpenAIEmbedding; print('import OK')"
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
