# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llama-index-instrumentation
pkgname=python-${_name}
pkgver=0.4.3
pkgrel=1
pkgdesc="This project provides the instrumentation hooks for observability in LlamaIndex"
arch=('any')
url="https://github.com/run-llama/llama_index/tree/main/llama-index-instrumentation"
license=('MIT')
depends=('python' 'python-deprecated' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6a8bd34b0c2fb9485971f952f3e5d63341eb87f8c55c82f2819a37e174494eb9')

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
