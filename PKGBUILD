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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d1/ee/8c58554942933f33752ccb86451ea0a15493808eb934f4899e4d2c43a408/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('37e05cd3483c64f410176fe614db8c84b6f42fc32cdadb3cc8ac8de18f01a97b')


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
