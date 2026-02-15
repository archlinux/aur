# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llama-index-workflows
pkgname=python-${_name}
pkgver=2.14.2
pkgrel=1
pkgdesc="An event-driven, async-first, step-based way to control the execution flow of AI applications like Agents"
arch=('any')
url="https://github.com/run-llama/workflows-py"
license=('MIT')
depends=('python' 'python-llama-index-instrumentation' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('b3f17a804c277901d30bc6e1b56398163db182ec48384f79ab16fdc9573b8877')


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
