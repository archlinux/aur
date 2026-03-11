# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llama-index-workflows
pkgname=python-${_name}
pkgver=2.15.1
pkgrel=1
pkgdesc="An event-driven, async-first, step-based way to control the execution flow of AI agent"
arch=('any')
url="https://github.com/run-llama/workflows-py"
license=('MIT')
depends=('python' 'python-llama-index-instrumentation' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('5e46dae2c683d3a9de800a4faf472b4aa915026b3f41bd36baba307b12cd3e7f')


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
