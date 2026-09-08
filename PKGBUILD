# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-embeddings-huggingface
pkgname=python-${_name}
pkgver=0.8.0
pkgrel=1
pkgdesc="LlamaIndex Embeddings Integration: Huggingface"
arch=('any')
url="https://pypi.org/project/llama-index-embeddings-huggingface/"
license=('MIT')
depends=('python' 'python-llama-index-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('02f34df13e3b83e9169fcfdf624b6fbe906fce75b7448cdf69800babc281a9a6')

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
