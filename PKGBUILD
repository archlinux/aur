# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-core
pkgname=python-${_name}
pkgver=0.14.12
pkgrel=1
pkgdesc="LlamaIndex Embeddings Integration: Huggingface"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
depends=('python' 'python-filetype' 'python-dataclasses-json' 'python-banks' 'python-griffe' 'python-sqlalchemy' 'python-llama-index-workflows')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/fd/d3/9d65f3c631a41fbb0dac47c52adad0fdbbaee3456518a97d558d8c754788/llama_index_core-0.14.12.tar.gz")
sha256sums=('6917e5865c6c789046dca001ebeea5a7f80e1ba83ac646dc793aaa041e8feb12')

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
