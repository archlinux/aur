# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-embeddings-huggingface
pkgname=python-${_name}
pkgver=0.7.0
pkgrel=1
pkgdesc="LlamaIndex Embeddings Integration: Huggingface"
arch=('any')
url="https://pypi.org/project/llama-index-embeddings-huggingface/"
license=('MIT')
depends=('python' 'python-llama-index-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('da8a2a65df9404112c4430dfada09d4f846ba165197a25dbe77f734014c56a87')

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
