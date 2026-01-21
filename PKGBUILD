# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llama-index-instrumentation
pkgname=python-${_name}
pkgver=0.4.2
pkgrel=1
pkgdesc="This project provides the instrumentation hooks for observability in LlamaIndex"
arch=('any')
url="https://github.com/run-llama/llama_index/tree/main/llama-index-instrumentation"
license=('MIT')
depends=('python' 'python-deprecated' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/af/b9/a7a74de6d8aacf4be329329495983d78d96b1a6e69b6d9fcf4a233febd4b/llama_index_instrumentation-0.4.2.tar.gz")
sha256sums=('dc4957b64da0922060690e85a6be9698ac08e34e0f69e90b01364ddec4f3de7f')

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
