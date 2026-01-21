# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llama-index-workflows
pkgname=python-${_name}
pkgver=2.12.2
pkgrel=1
pkgdesc="An event-driven, async-first, step-based way to control the execution flow of AI applications like Agents."
arch=('any')
url="https://github.com/run-llama/workflows-py"
license=('MIT')
depends=('python' 'python-llama-index-instrumentation' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/run-llama/workflows-py/archive/refs/tags/${_name}@v${pkgver}.tar.gz")
sha256sums=('756163cd4febf196bebd61d86cc0bb3ad9c3510be0dbfc9b14a133f012aa238e')

build() {
    cd "${srcdir}"/workflows-py-${_name}-v${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/workflows-py-${_name}-v${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  #test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/workflows-py-${_name}-v${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
