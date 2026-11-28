# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-core
pkgname=python-${_name}
pkgver=0.14.26
pkgrel=1
pkgdesc="The core python package to the LlamaIndex library"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
depends=('python' 'python-filetype' 'python-dataclasses-json' 'python-banks' 'python-griffe' 'python-sqlalchemy' 'python-llama-index-workflows' 'python-llama-index-instrumentation')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('dba58bc3fdb4e0a9fb52f8c53123d5a2576b3a8a991b65cd6d19796295f0bcd9')

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
