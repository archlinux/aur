# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llama-index-instrumentation
pkgname=python-${_name}
pkgver=0.6.0
pkgrel=1
pkgdesc="This project provides the instrumentation hooks for observability in LlamaIndex"
arch=('any')
url="https://github.com/run-llama/llama_index/tree/main/llama-index-instrumentation"
license=('MIT')
depends=('python' 'python-deprecated' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('b185c4e28a7f32899c27649cc2e2d7d54267fa2ff0cd43cbe2b5212bae98fe3a')

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
