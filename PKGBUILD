# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-embeddings-huggingface
pkgname=python-${_name}
pkgver=0.6.1
pkgrel=1
pkgdesc="LlamaIndex Embeddings Integration: Huggingface"
arch=('any')
url="https://pypi.org/project/llama-index-embeddings-huggingface/"
license=('MIT')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/a1/a0/77beca4ed28af68db6ab9c647b3fa75fae905d33ace96e91010cc9b96027/llama_index_embeddings_huggingface-0.6.1.tar.gz")
sha256sums=('3b21ffeda22f8221ed55778bb3daed71664ab07b341f1dd2f408963bd20355b9')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  #test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
